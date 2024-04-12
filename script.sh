#!/bin/bash
   path="$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Bookmarks"
   i=0
   j=0
   name=`cat ${path} | jq .roots.bookmark_bar.children[${j}].name`
   name="${name:1:-1}"
   while [ "${name}" != "Learning" ]
   do
	   j=$((j+1))
           name=`cat ${path} | jq .roots.bookmark_bar.children[${j}].name`
           name="${name:1:-1}"
   done
   name=`cat ${path} | jq .roots.bookmark_bar.children[${j}].children[${i}]`
   while [ "${name}" != null ]
   do
	   file=`cat ${path} | jq .roots.bookmark_bar.children[${j}].children[${i}].name`
	   file="${file:1:-1}"
	   cat "${path}" | jq .roots.bookmark_bar.children["${j}"].children["${i}"] > "${file}.json"
	   i=$((i+1))
           name=`cat ${path} | jq .roots.bookmark_bar.children[${j}].children[${i}]`
   done
