window.onload = () => {
  getuserActivityFeed()
}

const getuserActivityFeed = () => {
  $('#get_activity').on('click', (e) => {
    e.preventDefault()
    let url = $('#get_activity').attr('href')
    fetch(`${url}.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(activity => {
        $('#list_activity').html('')
        console.log(activity)

        activity.communities.forEach((community) => {
          let newUserCommunity = new UserCommunity(community)
          let userCommunityHtml = newUserCommunity.formatIndex()
          $('#list_activity').append(userCommunityHtml)
        })

        activity.posts.forEach((post) => {
          console.log(post.community_id)
          let newUserPost = new UserPost(post)
          let userPostHtml = newUserPost.formatIndex()
          $('#list_activity').append(userPostHtml)
        })

        // activity.comments.forEach((comment) => {
        //  $('#list_activity').append(comment.content)
        // })
      })
  })
}

function UserCommunity (community) {
  this.id = community.id
  this.title = community.title
  this.description = community.short_description
}

UserCommunity.prototype.formatIndex = function () {
  let communityHtml = `
    <a href="/communities/${this.id}"><h2>${this.title}</h2></a>
    <p class="description">${this.description}</p>
  `
  return communityHtml
}

function UserPost (post) {
  this.id = post.id
  this.title = post.title
  this.communityId = post.community_id
}

UserPost.prototype.formatIndex = function () {
  let postHtml = `<a href="/communities/${this.communityId}/posts/${this.id}"><h2>${this.title}</h2></a>`
  return postHtml
}