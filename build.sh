if [ $(echo "$(cat imageamazon.py)" | sed 's/asin2/asin1/g' | python - |wc -l) -gt "0" ]; then
 echo "echo \"\$(cat titleamazon.py)\" | sed 's/asin2/asin1/g' | python - | tr -cd '[[:alnum:]] .,&:' | sed 's/.*/\L&/; s/[a-z]*/\u&/g' | cut -c -150 | sed 's/.*/$(printf "Best Buy New \nBest Price New \nBest Cheap New \nBest Compare New \nNew Best Buy \nNew Best Price \nNew Best Cheap \nNew Best Compare" | shuf -n 1)&$(printf " On Sale 2016\n Review 2016\n Discount 2016" | shuf -n 1)/' > deletetitleamazon.txt" | bash -
 echo "$(cat titleamazon.py)" | sed 's/asin2/asin1/g' | python - | tr -cd '[[:alnum:]] .,&:' | sed 's/.*/\L&/; s/[a-z]*/\u&/g' > deletetitleamazon2.txt
 echo "$(cat imageamazon.py)" | sed 's/asin2/asin1/g' | python - > deleteimageamazon.txt
 #Scrape image
 echo "curl -A 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0, Googlebot-Image/1.0' '$(< \deleteimageamazon.txt)' -o /home/www/domain/image/asin1.jpg" | bash -
 echo "$(cat descriptionamazon.py)" | sed 's/asin2/asin1/g' | python - | tr -cd '[[:alnum:]] .,/"&()%:!-+=' | sed -e 's/a/ä/g' -e 's/    Product Description//g' > deletedescriptionamazon.txt
 echo "$(cat detailamazon.py)" | sed 's/asin2/asin1/g' | python - | awk 1 ORS='<br/>' | tr -cd '[[:alnum:]] .,/"&()%:!-+=<>' | sed -e 's|a|ä|g' -e 's|<br/>  <br/>  ||g' -e 's|<br/><br/>||g' -e 's|Product Detäils<br/>  <br/>|Product Detäils :<br/>|g' -e 's|  Feätures|Feätures :<br/>|g' > deletedetailamazon.txt
 echo "$(cat reviewamazon.py)" | sed 's/asin2/asin1/g' | python - | awk 1 ORS='<br/>' | tr -cd '[[:alnum:]] .,/"&()%:!-+=<>' | sed -e 's|a|ä|g' -e 's|<br/>  <br/>  ||g' -e 's|<br/><br/>||g' > deletereviewamazon.txt
 echo "echo \"\$(cat ask.py)\" | sed 's/deleteask/$(cat deletetitleamazon.txt | tr -cd '[[:alnum:]] ' | sed 's/ /+/g')/g' | python -" | bash - | sed -e '/^$/d' -e 's|,||g' | awk 1 ORS=',' | tr -cd '[[:alnum:]] ,' | sed -e 's|,,,|,|g' -e 's|,,|,|g' -e 's/.$//' > deleteask.txt
 #description
 echo "<h3>$(cat deletetitleamazon2.txt)</h3><br/><div style=\"text-align: center;\"><img src=\"http://www.domain.ekstension/image/asin1.jpg\" alt=\"$(cat deletetitleamazon.txt)\" /><br/><br/><a $(printf "eyabayanes\ntulkanoli\njasunamikon\nkolpokloij\ngulanjuikolpo\npalasantoliong\ndongkelapolik\ndasmutyuki" | shuf -n 1)$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')\" title=\"Click this button to check product on ebay\" target=\"_blank\" class=\"fasc-button fasc-size-xlarge fasc-type-glossy fasc-rounded-medium fasc-ico-before dashicons-cart\" style=\"background-color: #db0d44; color: #ffffff;\" data-fasc-style=\"background-color:#db0d44;color:#ffffff;\">Check Product On Ebay</a></div><br/><div style=\"text-align: justify;\">$(cat deletedescriptionamazon.txt)<br/>$(cat deletedetailamazon.txt)<br/><br/><center><a $(printf "eyabayanes\ntulkanoli\njasunamikon\nkolpokloij\ngulanjuikolpo\npalasantoliong\ndongkelapolik\ndasmutyuki" | shuf -n 1)$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')\" title=\"Click this button to check best price on ebay\" target=\"_blank\" class=\"fasc-button fasc-size-xlarge fasc-type-glossy fasc-rounded-medium fasc-ico-before dashicons-cart\" style=\"background-color: #db0d44; color: #ffffff;\" data-fasc-style=\"background-color:#db0d44;color:#ffffff;\">Check Best Price On Ebay</a></center><br/>$(cat deletereviewamazon.txt)<br/>$(cat deleteask.txt)<br/><center><a $(printf "eyabayanes\ntulkanoli\njasunamikon\nkolpokloij\ngulanjuikolpo\npalasantoliong\ndongkelapolik\ndasmutyuki" | shuf -n 1)$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')\" title=\"Click this button to buy on ebay\" target=\"_blank\" class=\"fasc-button fasc-size-xlarge fasc-type-glossy fasc-rounded-medium fasc-ico-before dashicons-cart\" style=\"background-color: #db0d44; color: #ffffff;\" data-fasc-style=\"background-color:#db0d44;color:#ffffff;\">Buy Now On Ebay</a></center></div>" > deletedescription.txt
 #upload youtube
 echo "wget -qO- --header=\"Accept: text/html\" --user-agent=\"Googlebot-Image/1.0\" \"http://www.bing.com/videos/search?scope=video&pq=$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')&sc=1-30&sp=-1&sk=&q=$(cat deletetitleamazon2.txt | tr -cd '[[:alnum:]] ' | tr A-Z a-z | sed 's/ /+/g')&qft=+filterui:msite-youtube.com\" | grep -o '<a href=['\"'\"'\"][^\"'\"'\"']*['\"'\"'\"]' | grep 'watch?v' | sed -e 's/^<a href=[\"'\"'\"']//' -e 's/[\"'\"'\"']$//' -e 's/https:\\/\\/www.youtube.com\\/watch?v=//g' | shuf -n 1 > deleteyoutube.txt" | bash -
 echo "<br/><style>.embed-container { position: relative; text-align: center; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'><iframe type=\"text/html\" width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/$(cat deleteyoutube.txt)?autohide=1&rel=0&controls=0&modestbranding=1&disablekb=1&theme=light&enablejsapi=1\" frameborder=\"0\"></iframe></div>" > deleteyoutube1.txt
 echo "$(cat deletetitleamazon.txt) |$(cat deletedescription.txt)$(cat deleteyoutube1.txt) |$(shuf -n 1 data/category.txt) |$(cat deleteask.txt) |$(shuf -n 1 data/author.txt) |$(($RANDOM % 10000))" >> /home/www/domain/wp-content/uploads/wpallimport/files/wordpress.csv
else
 clear
fi
find . -maxdepth 1 -type f -name "delete*" -delete
