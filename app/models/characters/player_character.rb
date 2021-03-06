class PlayerCharacter < Character
	after_create :set_languages
	validates_uniqueness_of :name

	def multiclassed?
		character_classes.count > 1
	end

	def multi_spellcaster?
		if character_classes.count > 1
			character_classes.all?{|c| c.is_caster? || c.is_half_caster?}
		else
			false
		end
	end

	def total_level
		character_classes.map(&:level).sum()
	end

	def is_caster?
		character_classes.any?{|c| c.is_caster? }
	end

	def is_half_caster?
		character_classes.any?{|c| c.is_half_caster?}
	end

	def no_magic?
		!character_classes.any?{|c| c.is_half_caster? || c.is_caster? }
	end

	def title
		"#{name} #{character_classes.each{|f| f.display_name}}"
	end

	def klass_name
		res = ''
		character_classes.each do |k|
			res += "#{k.klass.name} #{k.level} / "
		end
		return res[0..-3]
	end

	def proficiency_bonus
		case total_level
		when 1..4
			"+2"
		when 5..8
			"+3"
		when 9..12
			"+4"
		when 13..16
			"+5"
		when 17..20
			"+6"
		end
	end

	def hit_dices
		res = ''
		character_classes.each do |k|
			res += "d#{k.klass.hit_die}/"
		end
		return res[0..-2]
	end

	def generate_pdf
		pdf = WickedPdf.new.pdf_from_url(Rails.application.routes.url_helpers.sheet_character_url(self.id, host: "https://character-sheets-5e.herokuapp.com/"))
		File.open("public/downloads/character_#{self.id}.pdf", 'wb') do |file|
			file << pdf
		end
	end

	private

	def set_languages
		self.languages << race.languages
		self.languages.uniq
		self.save
	end
end