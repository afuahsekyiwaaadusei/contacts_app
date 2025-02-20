# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Truncate the tables
# Be cautions when destroying the records in the db on production.
User.destroy_all
UserRole.destroy_all
Role.destroy_all
Permission.destroy_all
PermissionsRole.destroy_all

# Load the Rails environment and constants
require_relative '../config/environment'
# require_relative '../config/initializers/constants'

# Run the Rake task to populate the permissions table
Rake::Task['permissions:permissions'].invoke

# set Super Admin Role
role = Role.new(
  name: 'ANM Super Admin',
  role_code: Role::ANMSADM_ROLE_CODE,
  role_type: Role::SUPER_ADMIN_TYPE,
  active_status: true,
  del_status: false
)

# set permissions for Super Admin
role.permissions = Permission.where(active_status: true, del_status: false)

# save role
role.save!

# Create Super Admin User and associate UserRole
User.create!(
  last_name: 'Super',
  first_name: 'Appsnmobile',
  mobile_number: '233302955701',
  username: 'anmsa',
  password: 'anmsa1234',
  password_confirmation: 'anmsa1234',
  email: 'anmsa@appsnmobilesolutions.com',
  user_role: UserRole.new(
    role_code: role.role_code,
    active_status: true,
    del_status: false
  )
)

# Update the crontab with whenever
system('whenever --update-crontab')

p('Seeder Executed successfully')
