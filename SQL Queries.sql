/*Identify the five oldest users on Instagram from the Database.*/

select * from users order by created_at asc limit 5; 

/*Inactive User Engagement:Identify users who have never posted a single photo on Instagram.*/

select users.id,username from users
	 left join photos
	 on users.id = photos.user_id where photos.id is NULL 
	 order by username asc; 

/*Contest Winner Declaration: The team has organized a contest where the user with the most likes on a single photo wins.*/

select users.id ,users.username ,photos.image_url,count(*) as `Total Likes` from likes
 inner join photos on photos.id = likes.photo_id
 inner join users on users.id = likes.photo_id
 group by photos.id
 order by `Total Likes` desc limit 1; 

/*Hashtag.Identify and suggest the top 5 most commonly used hashtags on the platform*/

select tag_name , count(*) as `Total occurences` from tags
	inner join photo_tags on tags.id = photo_tags.tag_id
	group by tags.id
	order by `Total occurences` desc limit 5; 

/*What day of the week do most users register on? Provide insights on when to schedule an ad campaign*/

select dayname(created_at) as day,count(*) as `Total registered users` from users
	group by day
	order by `Total registered users` desc; 

Investor Metrics:

/*User Engagement: Are users still as active and post on Instagram or they are making fewer posts.Find how many times does average user posts on Instagram.*/ 

select (select count(*) from photos)/(select count(*) from users) as Avg_posts

/* total number of photos on Instagram/total number of users*/

