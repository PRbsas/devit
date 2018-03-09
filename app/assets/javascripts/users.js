document.addEventListener('turbolinks:load', () => {
  getuserActivityFeed()
})

const getuserActivityFeed = () => {
  $('#get_activity').on('click', (e) => {
    e.preventDefault()

    let url = $('#get_activity').attr('href')
    fetch(`${url}.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(activity => {
        $('#list_activity').html('')

        getCommunities(activity)
        getPosts(activity)
        getComments(activity)
      })
  })
}

const getCommunities = (activity) => {
  activity.communities.forEach((community) => {
    let newUserCommunity = new UserCommunity(community)
    let userCommunityHtml = newUserCommunity.formatIndex()
    $('#list_activity').append(userCommunityHtml)
  })
}

const getPosts = (activity) => {
  activity.posts.forEach((post) => {
    let newUserPost = new UserPost(post)
    let userPostHtml = newUserPost.formatIndex()
    $('#list_activity').append(userPostHtml)
  })
}

const getComments = (activity) => {
  activity.comments.forEach((comment) => {
    let newUserComment = new UserComment(comment)
    let userCommenttHtml = newUserComment.formatIndex()
    $('#list_activity').append(userCommenttHtml)
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
  this.link = post.link
  this.communityId = post.community_id
}

UserPost.prototype.formatIndex = function () {
  let postHtml = `
    <a href="/communities/${this.communityId}/posts/${this.id}"><h2>${this.title}</h2></a>
    <a href="${this.link}">${this.link}</a>
  `
  return postHtml
}

function UserComment (comment) {
  this.id = comment.id
  this.content = comment.content
  this.postId = comment.post_id
}

UserComment.prototype.formatIndex = function () {
  let commentHtml = `<a href="/posts/${this.postId}"><p>${this.content}</p></a>`
  return commentHtml
}