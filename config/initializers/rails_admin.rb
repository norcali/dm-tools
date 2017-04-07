RailsAdmin.config do |config|
  require 'i18n'

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
  end
end
