import algoliasearch from 'algoliasearch/lite';
import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';

const searchClient = algoliasearch('QDUXU5A7T5', '4b3d7f3ed4513551f9912570b67a5d44');

const search = instantsearch({
  indexName: 'Book',
  searchClient,
});

search.addWidgets([
  searchBox({
    container: "#searchbox",
  }),

  instantsearch.widgets.hits({
    container: '#hits',
    templates: {
      item: `
        <div>
          <img src="{{cover}}" align="left" alt="{{name}}" />
          <div class="hit-name">
            {{#helpers.highlight}}{ "attribute": "name" }{{/helpers.highlight}}
          </div>
          <div class="hit-drawer">
            {{#helpers.highlight}}{ "attribute": "drawer" }{{/helpers.highlight}}
          </div>
          <div class="hit-editor">\${{editor}}</div>
        </div>
      `,
    },
  }),

  hits({
    container: "#hits"
  })
]);

search.start();
