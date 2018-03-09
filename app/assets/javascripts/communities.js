document.addEventListener('turbolinks:load', () => {
  getCommunitiesIndex()
  getCommunity()
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
        renderCommunityIndex(communities)
      })
  })
}

const renderCommunityIndex = (communities) => {
  communities.forEach((community) => {
    let newCommunity = new Community(community)
    $('.wrapper').append(newCommunity.formatIndex())
  })
}

const getCommunity = () => {
  $(document).on('click', '.show_community', function (e) {
    e.preventDefault()
    let id = $(this).attr('data-id')
    history.pushState(null, null, `communities/${id}`)
    fetch(`/communities/${id}.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(community => {
        $('.wrapper').html('')
        let posts = community.posts
        renderCommunityShow(community)
        renderPostIndex(posts)
      })
  })
}

const getNextCommunity = () => {
  $(document).on('click', '.next_community', function (e) {
    e.preventDefault()
    let id = $(this).data('id')
    history.pushState(null, null, `/${id}`)
    fetch(`/communities/${id}/next`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(community => {
        $('.wrapper').html('')
        let posts = community.posts
        renderCommunityShow(community)
        renderPostIndex(posts)

      })
  })
}

const renderCommunityShow = (community) => {
  let newCommunity = new Community(community)
  $('.wrapper').append(newCommunity.formatShow())
}

const renderPostIndex = (posts) => {
  posts.forEach(post => {
    let newPost = new Post(post)
    $('.wrapper').append(newPost.formatIndex())
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
      <a href="/communities/${this.id}" class="show_community" data-id="${this.id}"><h2>${this.title}</h2></a>
      <p class="description">${this.description}</p>
      </li>
    </ul>
  </section>
  `
  return communityHtml
}

Community.prototype.formatShow = function () {
  let communityHtml = `
  <section id="list">
    <ul>
      <li>
        <h2>${this.title}</h2>
        <p class="description">${this.description}</p>
        <p id="nav-button"><a class="next_community" data-id="${this.id}">Next</a></p>
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
