class FetchContentService

  def self.execute
    sql = "#{movies_sql} Union All #{season_sql} ORDER BY created_at DESC"
    result = ActiveRecord::Base.connection.execute(sql)
  end

  private

  def self.movies_sql
    Movie.select("id, title, plot, created_at, 'movie' as type").all.to_sql
  end

  def self.season_sql
    Season.select("id, title, plot, created_at, 'season' as type").all.to_sql
  end
end
