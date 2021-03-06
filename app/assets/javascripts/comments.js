document.addEventListener('turbolinks:load', () => {
  loadComments()
})

const loadComments = () => {
  $(document).unbind().on('submit', 'form#new_comment', function (e) {
    e.preventDefault()

    let url = $(this).attr('action')
    console.log(url)

    fetch(url, {
      credentials: 'include',
      method: 'post',
      headers: {
        'Accept': 'application/json, application/xml, text/plain, text/html, *.*',
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
      },
      body: $(this).serialize()
    })
      .then((res) => res.json())
      .then(comment => {
        let newComment = new Comment(comment)
        let commentHtml = newComment.formatList()
        $('#list-posts').append(commentHtml)

        $('textarea#comment_content').val('')
        $('form').hide()
        //$('input[type=submit]').removeAttr('disabled')
        //$('input[type=submit]').prop('disabled', true)
      })
  })
}

class Comment {
  constructor (comment) {
    this.id = comment.id
    this.content = comment.content
  }

  formatList () {
    let commentHtml = `<h6>${this.content}</h6>`
    return commentHtml
  }
}
