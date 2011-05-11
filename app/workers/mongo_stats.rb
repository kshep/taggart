#!/usr/bin/env ruby

class MongoStats

  @queue = :default

  def self.perform()

    conn = MongoMapper.connection

    server_status = conn['admin'].command('serverStatus' => 1)

    db_stats = {}

	  conn.database_names.each do |db_name|
      db_stats[db_name] = conn[db_name].stats()
	  end

	  Event.create(:type => self.to_s, :data => { :server_status => server_status, :db_stats => db_stats })

  end
end
