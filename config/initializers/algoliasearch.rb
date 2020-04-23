AlgoliaSearch.configuration = {
  application_id: 'QDUXU5A7T5',
  api_key: 'b258ebbd0795e40de3eb8427c50a2d04'
}

client = Algolia::Client.new(application_id: 'QDUXU5A7T5',
                    api_key:        'b258ebbd0795e40de3eb8427c50a2d04')
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
