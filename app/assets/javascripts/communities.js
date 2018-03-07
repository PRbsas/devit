document.addEventListener('turbolinks:load', () => {
  getCommunitiesIndex()
  getNextCommunity()
})

const getCommunitiesIndex = () => {
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

const getNextCommunity = () => {
  $('.show_next').on('click', (e) => {
    e.preventDefault()
    // history.pushState(null, null, 'communities')
    let next = $('.show_next').data('id') + 1
    fetch(`/communities/${next}.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(community => {
        $('.wrapper').html('')
        let newCommunity = new Community(community)
        let communityHtml = newCommunity.formatIndex()
        $('.wrapper').append(communityHtml)

        community.posts.forEach(post => {
          let newPost = new Post(post)
          let PostHtml = newPost.formatIndex()
          $('.wrapper').append(PostHtml)
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
        <a href="/communities/${this.id}"><h2>${this.title}</h2></a>
        <p class="description">${this.description}</p>
      </li>
    </ul>
  </section>
  `
  return communityHtml
}

function Post (post) {
  this.id = post.id
  this.title = post.title
  this.communityId = post.community_id
}

Post.prototype.formatIndex = function () {
  let postHtml = `
  <section id="list-posts">
    <ul>
      <li>
        <a href="/communities/${this.communityId}/posts/${this.id}"><h2>${this.title}</h2></a>
      </li>
    </ul>
   </section>
  `
  return postHtml
}
