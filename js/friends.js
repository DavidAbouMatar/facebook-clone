$(document).ready(getFriends);


function getFriends(){
    getFriendsAPI().then(friends => {
        var frnd = "";
        $.each(friends, function(index, friend){
          frnd += `<div class="col-md-6 col-sm-6">
          <div class="friend-card">
              <img src="images/covers/1.jpg" alt="profile-cover" class="img-responsive cover" />
              <div class="card-info">
              <img src="images/users/user-3.jpg" alt="user" class="profile-photo-lg" />
              <div class="friend-info">

              <h5><a href="timeline.html" class="profile-link">`+ friend.name + ` ` +  friend.last_name +`</a></h5>
              <button value="` + friend.id +`"   onclick="blockUser(this.value)" class="btn btn-danger  pull-right block` + friend.id +`" style="float:left !important">Block</button>

              <button value="` + friend.id +`" onclick="unfriend(this.value); this.disabled = true;" class="btn btn-primary pull-right unfriend` + friend.id +`">Unfriend</button>


              </div>

            </div>

          </div>
        </div>
`
        });
        $(".friend-list").append(frnd);
   
    });
}


async function getFriendsAPI(){
    const response = await fetch("http://localhost/friend-finder/Controllers/api/friendsApi.php");
    
    if(!response.ok){
        const message = "ERROR OCCURED";
        throw new Error(message);
    }
    
    const friends = await response.json();
    return friends;
}

//block users
function blockUser(id){
    var url ='http://localhost/friend-finder/Controllers/api/block.php'
    fetchAPI(url,id)
    $('.block'+id).parent().parent().parent().remove()
 
  }


function unfriend(id){
    var url ='http://localhost/friend-finder/Controllers/api/remove_friend.php'
    fetchAPI(url,id)
    $('.block'+id).parent().parent().parent().remove()

}

async function fetchAPI(url,id){
    const response = await fetch(url,{
    method: 'POST',
    body: new URLSearchParams({"id": id})
  });
  if(!response.ok){
    const message = "ERROR OCCURED";
    throw new Error(message);
  }
  
  const success = await response.json();
  return success;
  }
  