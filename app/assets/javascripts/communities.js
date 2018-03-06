$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.list_communities').on('click', (e) => {
    e.preventDefault()

    fetch(`/communities.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(communities => {
        $('.wrapper').html('')
        communities.forEach((community) => {
          console.log(community)
        })
      })
  })
}
