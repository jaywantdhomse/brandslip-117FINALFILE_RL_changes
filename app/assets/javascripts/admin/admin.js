
function approve_selected_users(action) {
    $("#success_msg").text("");
    var user_ids = [];
    $("td input#brandslip_user").each(function() {
        if ($(this).is(':checked')) {
            user_ids.push($(this).attr('value'));
        }
    });
    var is_approved = 0;
    if(action == "approve"){
        is_approved = 1;
    }else if(action == 'reject'){
        is_approved = 2;
    }
    alert(user_ids);
    if (user_ids.length > 0) {
        $.ajax({
            url: "action_on_selected_user",
            type: "post",
            dataType: 'json',
            data: {
                "user_id": user_ids,
                "is_approved": is_approved
            },
            beforeSend: function() {
                $("#ajaxloading").css({
                    'display': 'inline-block'
                });
            },
            complete: function() {
                $("#ajaxloading").css({
                    'display': 'none'
                });
            },
            success: function(data) {
                
                for(var index = 0; index < user_ids.length; index ++){
                    var status = "";
                    if(action == 'approve'){
                        status = "Approved";
                        $("#tr_"+user_ids[index]).find("td#td_status").text(status).css("color", "green");
                    }else if(action == 'reject'){
                        status = "Rejected";
                        $("#tr_"+user_ids[index]).find("td#td_status").text(status).css("color", "red");
                    }
                }
                if(action=='approve'){
                    $("span#success_msg").text("User(s) approved Successfully ").css("color", "green");
                }else{
                    $("span#success_msg").text("User(s) rejected Successfully ").css("color", "red");
                }
                
            }
        });  
    } else {
        alert('Please select atleast one user to ' + action);
    }
    return false;
}