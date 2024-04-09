#!/bin/bash
   path="$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Bookmarks"
   i=0
   name=`cat ${path} | jq .roots.bookmark_bar.children[${i}]`
   while [ "${name}" != null ]
   do
	   file=`cat ${path} | jq .roots.bookmark_bar.children[${i}].name`
	   file="${file:1:-1}"
	   cat "${path}" | jq .roots.bookmark_bar.children["${i}"] > "${file}"
	   i=$((i+1))
	   name=`cat ${path} | jq .roots.bookmark_bar.children[${i}]`
   done

