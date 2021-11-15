{literal}
    <div id="app">
        {{titulo}}
        <ul id="comment-list" class="list-group">
            <li v-for="comment in comments" class="list-group-item">
                {{comment.comment}} | {{comment.score}}
            </li>
        </ul>
    </div>
{/literal}