atom_feed(:root_url => url_for(:format => nil, :only_path => false)) do |feed|
  feed.title("Votes by #{@person.official_name}")
  feed.updated(@person.votes.latest.date)

  for action in @actions
    feed.entry(action) do |entry|
      entry.title(action.action)
      entry.content(action.description, :type => 'html')
      entry.updated(action.date)

      entry.author do |author|
        author.name("OpenGovernment")
        author.uri("http://opengovernment.org")        
      end
    end
  end
end