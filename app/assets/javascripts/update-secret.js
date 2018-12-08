$(function(){
    $(document).on('click', '.actions input#secret-submit', function (event) {
        secretId = JSON.parse(event.target.dataset.id);
        $.ajax({
            type: "PUT",
            url: '/secrets/update',
            data: {
                secret: {
                    id: secretId,
                    name: document.getElementById("secret-name").value,
                    key: document.getElementById("secret-key").value,
                    password: document.getElementById("secret-password").value
                }
            },
            success: function(data) {
                alert("更新に成功しました");
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("更新に失敗しました");
                console.log("XMLHttpRequest : " + XMLHttpRequest.status);
                console.log("textStatus     : " + textStatus);
                console.log("errorThrown    : " + errorThrown.message);
            },
            dataType: 'json',
        });
    })
});