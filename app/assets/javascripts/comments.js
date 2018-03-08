document.addEventListener('turbolinks:load', () => {
  loadComments()
})

const loadComments = () => {
  $(document).on('submit', 'form#new_comment', function (e) {
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
        console.log(comment)
      })
  })
}
