require './lib/twads'
require 'rake'

namespace :db do
  desc 'create database tables'
  task :create_schema do
    DB.create_table :twitter_users do
      primary_key :id
      String    :screen_name, :unique => true
      DateTime  :twitter_created_at
      Integer   :followers_count
      Integer   :friends_count
      Integer   :twitter_id
      Integer   :listed_count
      String    :name
      TrueClass :processed, :default => false

      DateTime :created_at
      DateTime :updated_at

      index :processed
    end
  end

  desc 'create database'
  task :create do
    db = Sequel.connect('postgres://localhost/template0')
    db.run 'CREATE DATABASE twads'
  end

  desc 'generate random twitter ids'
  task :generate_ids do
    DB.run 'INSERT INTO twitter_users (twitter_id) select generate_series(1,750000000), NOW() order by random();'
  end

end
