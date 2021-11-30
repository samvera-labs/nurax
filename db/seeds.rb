# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Hyrax::AdminSetCreateService.find_or_create_default_admin_set.id

admin_role = Role.find_or_create_by(name: 'admin')
admin_role.users << User.find_or_create_by!(email: 'admin@localhost', password: 'testing')
admin_role.save
