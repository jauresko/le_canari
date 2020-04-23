AlgoliaSearch.configuration = {
  application_id: ENV['ALGOLIA_SEARCH_APPLICATION_ID'],
  api_key: ENV['ALGOLIA_SEARCH_API_KEY']
}

client = Algolia::Client.new(application_id: ENV['ALGOLIA_SEARCH_APPLICATION_ID'],
                    api_key:        ENV['ALGOLIA_SEARCH_API_KEY'])
index = client.init_index('book')

index.set_settings(
  searchableAttributes: [
    'name',
    'category',
    'editor',
    'drawer'
  ],
  customRanking: [
    'desc(popularity)'
  ],
)
