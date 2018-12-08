$(function(){
    $('.secret-action').on('click', function (event) {
        console.log("aaaaaaaaa");
        secretData = JSON.parse(event.target.dataset.secret);
        decryptPass = event.target.dataset.password;
        isShow = JSON.parse(event.target.dataset.isShow);
        if ($('.add-secret-row').is(':visible')) {
            $(`tr[add-data-row='${secretData.id}']`).remove();
        } else {
            secretData = {
                id: secretData.id,
                name: secretData.name,
                key: secretData.key,
                password: decryptPass,
                is_show: isShow
            },

                template = `
            <tr class="add-secret-row" add-data-row={{id}}>
              <td>
                {{#is_show}}
                <input id='secret-name'
                       name="secret[name]"
                       type="text"
                       value={{name}}
                       class="form-control"
                       >
                {{/is_show}}
                {{^is_show}}
                    <span>{{name}}</span>
                {{/is_show}}
              </td>
              <td>
                {{#is_show}}
                    <input id='secret-key'
                           name="secret[key]"
                           type="text"
                           value={{key}}
                           class="form-control"
                           >
                {{/is_show}}
                {{^is_show}}
                    <span>{{key}}</span>
                {{/is_show}}
              </td>
              <td>
                {{#is_show}}
                    <input id='secret-password'
                           name="secret[password]"
                           type="text"
                           value={{password}}
                           class="form-control"
                           >
                {{/is_show}}
                {{^is_show}}
                    <span>{{password}}</span>
                {{/is_show}}
              </td>
              <td class="actions">
                {{#is_show}}<input type="submit" id="secret-submit" class="submit" data-id="{{id}}" value="更新" >{{/is_show}}
              </td>
            </tr>
            `;

            html = Mustache.to_html(template, secretData);
            $(`tr[data-row='${secretData.id}']`).after(html);
        }
    })
});