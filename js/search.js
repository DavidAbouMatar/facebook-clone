

function search(name){
    fetchUsers(name)
}

//call for search api
async function fetchUsers(name){
    const response = await fetch('http://localhost/friend-finder/Controllers/api/search.php',{
    method: 'POST',
    body: new URLSearchParams("name=" + name)
})
.then(response => response.json())
.then(response => displayResults(response))
.catch(e => console.error('Error' + e))

const search = await response
return search;
}

function displayResults(data){

    var trHTML = "";
    $(".nearby-user").remove();
    $.each(data, function (i, item) {
      trHTML +=
      `  <div class="nearby-user">
      <div class="row">
        <div class="col-md-2 col-sm-2">
          <img src="images/users/user-15.jpg" alt="user" class="profile-photo-lg" />
        </div>
        <div class="col-md-7 col-sm-7">
          <h5><a href="#" class="profile-link">`+ item.Name + ` ` +  item.last_name +`</a></h5>
          <div class="col-md-4 col-sm-4">
          <button value="` + item.id +`" onclick="addFriends(this.value); this.disabled = true;" class="btn btn-primary pull-right addFriend` + item.id +`">Add Friend</button>
        </div>
        </div>
        
        <div class="col-md-3 col-sm-3">
          <button value="` + item.id +`"   onclick="blockUser(this.value)" class="btn btn-danger pull-right block` + item.id +`">Block</button>
        </div>
      </div>
    </div>`
    //   $('div').addClass("nearby-user"),
        // "<tr><td>" +
        // item.Name +
        // "</td></tr>";
    });
    $("#content").append(trHTML);
}



function addFriends(id){

  var url ='http://localhost/friend-finder/Controllers/api/add_friend.php'
  fetchAPI(url,id)
  // this.(html)('pending')
  $('.addFriend'+id).text('pending')

}

function blockUser(id){
  var url ='http://localhost/friend-finder/Controllers/api/block.php'
  fetchAPI(url,id)
  $('.block'+id).parent().parent().parent().remove()

}

// function acceptRequest(id){
//   console.log('blablabla',id)
//   var url ='http://localhost/friend-finder/Controllers/api/accept_friend_request.php'
//   fetchAPI(url,id)
//   $('.friend_request'+id).closest('li').remove();
//   $('.badge').text($('.badge').text()-1)

// }


async function fetchAPI(url,id){
  const response = await fetch(url,{
  method: 'POST',
  body: new URLSearchParams({"id": id})
});


const success = await response.json();
return success;
}



