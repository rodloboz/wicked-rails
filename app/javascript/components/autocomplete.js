import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  const searchInput = document.getElementById('query');

  if (skills && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
        $.getJSON('/autocomplete',
          { q: term },
          function(data) {
            console.log(data)
            return data;
        })
        // .then((data) => {
        //   const matches = []
        //   data.skills.forEach((skill) => {
        //     matches.push({type: 'skill', name: skill });
        //   });
        //   data.users.forEach((user) => {
        //     matches.push({type: 'user', name: user });
        //   });
        //   suggest(matches)
        // });
      },
      // renderItem: renderItem,
    });
  }
};

export { autocompleteSearch };
