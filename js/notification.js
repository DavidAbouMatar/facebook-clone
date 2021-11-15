$(document).ready(getNotification);


function getNotification(){
    getNotificationAPI().then(notification => {
        $('.badge').text(notification.length)
        console.log('length',notification.length)
        var li = ''
        $.each(notification, function(index, notif){
            li += `<li type="text" style="color:white" class="friend_request` + notif.request_user_id + `" onclick='return acceptRequest(this.value)' value="` + notif.request_user_id + `"> ` + notif.name +` has sent you a friend request </li>`
            
        });
        $("#home_notification").append(li);
       
    });

}




async function getNotificationAPI(){
    const response = await fetch("http://localhost/friend-finder/Controllers/api/notification.php");
    
    if(!response.ok){
        const message = "ERROR OCCURED";
        throw new Error(message);
    }
    
    const notification = await response.json();
    return notification;
}

function acceptRequest(id){
    console.log('blablabla',id)
    var url ='http://localhost/friend-finder/Controllers/api/accept_friend_request.php'
    fetchAPI(url,id)
    $('.friend_request'+id).closest('li').remove();
    $('.badge').text($('.badge').text()-1)
  
  }

  async function fetchAPI(url,id){
    const response = await fetch(url,{
    method: 'POST',
    body: new URLSearchParams({"id": id})
  });
  
  
  const success = await response.json();
  return success;
  }