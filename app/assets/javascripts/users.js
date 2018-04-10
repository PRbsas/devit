document.addEventListener('turbolinks:load', () => {
  getUserActivityFeed()
})

const getUserActivityFeed = () => {
  $('#get_activity').on('click', (e) => {
    e.preventDefault()

    let url = $('#get_activity').attr('href')
    fetch(`${url}.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(activity => {
        $('#list_activity').html('')

        getFlairs(activity)
        getUserExperience(activity)
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

const getFlairs = (activity) => {
  activity.flairs.forEach((flair) => {
    let newUserFlair = new UserFlair(flair)
    $('#list_activity').append(newUserFlair.formatFlair())
  })
}

const getUserExperience = (activity) => {
  activity.user_flairs.forEach((experience) => {
    let newUserExperience = new UserExperience(experience)
    $('#list_activity').append(newUserExperience.formatExperienceLevel())
  })
}

class UserCommunity {
  constructor (community) {
    this.id = community.id
    this.title = community.title
    this.description = community.short_description
  }

  formatIndex () {
    let communityHtml = `
    <li>
      <a href="/communities/${this.id}"><h2>${this.title}</h2></a>
      <p>${this.description}</p>
    </li>
    `
    return communityHtml
  }
}

class UserPost {
  constructor (post) {
    this.id = post.id
    this.title = post.title
    this.link = post.link
    this.communityId = post.community_id
  }

  formatIndex () {
    let postHtml = `
    <li>
      <a href="/communities/${this.communityId}/posts/${this.id}"><h2>${this.title}</h2></a>
      <a href="${this.link}"><h4>${this.link}</h4></a>
    </li>
    `
    return postHtml
  }
}

class UserComment {
  constructor (comment) {
    this.id = comment.id
    this.content = comment.content
    this.postId = comment.post_id
  }

  formatIndex () {
    let commentHtml = `
    <li>
      <a href="/posts/${this.postId}">${this.content}</a>
    </li>
    `
    return commentHtml
  }
}

class UserFlair {
  constructor (flair) {
    this.name = flair.name
  }

  formatFlair () {
    let userFlairHtml = `<a class= "flairs">${this.name}</a>`
    return userFlairHtml
  }
}

class UserExperience {
  constructor (experience) {
    this.level = experience.experience_level
  }

  formatExperienceLevel () {
    let UserExperienceHtml = `<a class= "flairs">${this.level}</a>`
    return UserExperienceHtml
  }
}
