#!/bin/bash
   path="$HOME/.var/app/com.brave.Browser/config/BraveSoftware/Brave-Browser/Default/Bookmarks"
   i=0
   type=`cat ${path} | jq .roots.bookmark_bar.children[${i}].type`
   type="${type:1:-1}"
   name=`cat ${path} | jq .roots.bookmark_bar.children[${i}]`
   while [ "${name}" != null ]
   do
	   file=`cat ${path} | jq .roots.bookmark_bar.children[${i}].name`
	   file="${file:1:-1}"
	   if [ "${file}" = "/e/os" ] || [ "${file}" = "iot cyber" ] || [ "${file}" = "stage" ] || [ "${file}" = "recherche" ] || [ "${file}" = "autre" ] || [ "${file}" = "emploi" ] || [ "${type}" = "url" ]
	   then
		   i=$((i+1))
		   name=`cat ${path} | jq .roots.bookmark_bar.children[${i}]`
                   type=`cat ${path} | jq .roots.bookmark_bar.children[${i}].type`
                   type="${type:1:-1}"
	   else
		   cat "${path}" | jq .roots.bookmark_bar.children["${i}"] > "${file}.json"
	           i=$((i+1))
		   name=`cat ${path} | jq .roots.bookmark_bar.children[${i}]`
                   type=`cat ${path} | jq .roots.bookmark_bar.children[${i}].type`
                   type="${type:1:-1}"
	   fi
   done

