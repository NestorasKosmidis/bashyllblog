#!/bin/bash
find ./posts -type f \
    | while read postfile; do
        title="$(./getPostTitle.sh < "$postfile")"
        postid="$(echo $title | ./getPostID.sh)" 
        if grep "$postid" "source/post_list" &> /dev/null; then
            echo "Regenerating $postid"
            ./generatePostHtml.sh "$postfile" "$postid"

            POST="source/post_content/$postid.html" \
            TITLE="$title" \
                ./makePost.sh > "./public/posts/$postid.html"
        fi
    done
