window.onload = () => {
  getuserActivityFeed()
}

const getuserActivityFeed = () => {
  $('#get_activity').on('click', (e) => {
    e.preventDefault()
    let url = $('#get_activity').attr('href')
    fetch(`${url}.json`, {credentials: 'same-origin'})
      .then((res) => res.json())
      .then(activities => {
        $('#list_activity').html('')
        console.log(activities.communities)
        activities.communities.forEach((community) => {
          console.log(community.title)
          $('#list_activity').append(community.title)
        })
      })
  })
}
