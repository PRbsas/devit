window.onload = () => {
  bindClickHandlers()
}

const bindClickHandlers = () => {
  $('.list_communities').on('click', (e) => {
    e.preventDefault()
    history.pushState(null, null, 'communities')

    fetch(`/communities.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(communities => {
        $('.wrapper').html('')
        communities.forEach((community) => {
          let newCommunity = new Community(community)
          let communityHtml = newCommunity.formatIndex()
          $('.wrapper').append(communityHtml)
        })
      })
  })
}

function Community (community) {
  this.id = community.id
  this.title = community.title
  this.description = community.short_description
}

Community.prototype.formatIndex = function () {
  let communityHtml = `
  <section id="list">
    <ul>
      <li>
        <a href="/communities/${this.id}"><h2>${this.title}</h2>
        <p class="description">${this.description}</p>
      </li>
    </ul>
  </section>
  `
  return communityHtml
}
