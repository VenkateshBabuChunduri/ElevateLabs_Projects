CREATE DATABASE youtube_trending;

USE youtube_trending;

CREATE TABLE youtube_trending_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    video_id VARCHAR(50) NOT NULL,
    trending_date DATE NOT NULL,
    title VARCHAR(255) NOT NULL,
    channel_title VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    publish_time DATE NOT NULL,
    tags TEXT,
    views INT NOT NULL,
    likes INT NOT NULL,
    dislikes INT NOT NULL,
    comment_count INT NOT NULL,
    thumbnail_link VARCHAR(255),
    comments_disabled BOOLEAN DEFAULT 0,
    ratings_disabled BOOLEAN DEFAULT 0,
    video_error_or_removed BOOLEAN DEFAULT 0,
    description TEXT,
    category_name VARCHAR(100)
);

DESCRIBE youtube_trending_data;


SELECT COUNT(*) FROM youtube_trending_data;

SELECT * FROM youtube_trending_data LIMIT 10;

-- rank categories by avg views

SELECT category_id, category_name, AVG(views) AS avg_views
FROM youtube_trending_data
GROUP BY category_id, category_name
ORDER BY avg_views DESC;

/*
✅ Insights from Results
1️⃣ Gaming is the top-ranked category with an average of 2,674,923 views per video.
2️⃣ Entertainment closely follows with 2,636,144 views per video.
3️⃣ Film & Animation, People & Blogs, and Sports are in the middle range.
4️⃣ Music has the lowest average views in this dataset (2,492,502 views).
✔ This means Gaming and Entertainment videos tend to get higher engagement on average than Music and other categories.

*/

-- - Finding the Top 5 Most Viewed Videos in Each Category:
SELECT category_id, category_name, video_id, views
FROM youtube_trending_data
ORDER BY views DESC
LIMIT 5;

/*
✅ Insights from Results
1️⃣ Music category dominates the top spot with the highest view count (4,999,501 views).
2️⃣ Gaming follows closely with 4,999,374 views, showing strong audience engagement.
3️⃣ Film & Animation appears twice in the top 5, proving consistent high-performance.
4️⃣ Sports ranks with a notable entry at 4,993,728 views, showing strong interest in athletic content.
These insights indicate which content categories are driving the highest engagement on YouTube.

*/

-- Checking the Average Likes per Category:
SELECT category_id, category_name, AVG(likes) AS avg_likes
FROM youtube_trending_data
GROUP BY category_id, category_name
ORDER BY avg_likes DESC;

/*

✅ Key Insights from Results
1️⃣ Film & Animation has the highest average likes (268,968 likes per video), meaning strong audience engagement.
2️⃣ Music follows closely with 253,832 likes per video, showing a high level of interaction.
3️⃣ Sports ranks in third place (251,539 avg likes), indicating enthusiastic fans engaging with content.
4️⃣ Gaming, People & Blogs, and Entertainment rank slightly lower, but still maintain significant engagement.
💡 This suggests Film & Animation and Music drive the highest audience interaction, likely due to emotionally engaging or artistic content.


*/




-- Analyzing Viewer Engagement (Likes-to-Views Ratio):
SELECT category_id, category_name, SUM(likes)/SUM(views) AS engagement_ratio
FROM youtube_trending_data
GROUP BY category_id, category_name
ORDER BY engagement_ratio DESC;


/*

✅ Key Insights from Results
1️⃣ Film & Animation has the highest engagement ratio (10.48%), meaning viewers engage with likes more often in this category.
2️⃣ Music follows closely (10.18%), showing strong audience interaction per view.
3️⃣ Sports ranks third (10.05%), proving loyal fan engagement with content.
4️⃣ People & Blogs, Gaming, and Entertainment round out the list with slightly lower engagement percentages.
💡 This suggests that Film & Animation and Music generate the strongest audience connections, possibly due to emotional storytelling, artistic appeal, or fandom culture.

*/