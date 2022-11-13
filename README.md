# NebulaProject

## Inspiration
We were inspired to do this challenge because of our own experiences and difficulties with multiple semesters of using the traditional website to look up courses. If this app becomes an option for UTD students, we think it will help them greatly, especially the new students.

## What it does
This super app merges the RateMyProfessor API and the Nebula API to create one app so that the students can view all their options in one place without having to use coursebook, utdgrades, and rmp separately.

## How we built it
We used flutter for the front end. First, we decided on the screens we wanted, including a landing page, login/registration, course details, section details, professor details, etc. For the backend, we used python with the flask API to create our routes. We went through the Nebula API documentation available at [link](https://www.utdnebula.com/docs/maintainers/Nebula%20API/getting-started) to create routes for sections, professors and courses endpoints as such:
```python
requests.get(nebulaURL+"course?subject_prefix=" +
                     prefix+"&course_number="+number, headers=header)
```
We also used the RateMyProfessor API to get the professor rating. All this was integrated into one intuitive web app.

## Challenges we ran into
Not being experienced with flutter, we faced some challenges in making an intuitive design in such a short time span. We also faced difficulties understanding and getting the nebula APIs to work properly, and it took a lot of trial and error to get everything working.

## Accomplishments that we're proud of
We are quite happy about getting the project to the state it is currently in within the time period given that we had minimal experience using flutter for such a project.

## What we learned
We learned about using APIs and parsing the data to use as we want. Most importantly, we learned a lot about using flutter and rapidly creating a web app.

## What's next for Nebula Labs
Next, we plan on integrating the rest of the Nebula endpoints. In the long term, we hope to be able to have the functionality of letting students register for their courses directly from our app as well.

![image](https://user-images.githubusercontent.com/59988556/201534787-cf91eead-f484-4d48-9303-3a25bc7940fa.png)
![image](https://user-images.githubusercontent.com/59988556/201534231-1e355f5a-be51-4509-9b18-efd1f1436cbb.png)
![image](https://user-images.githubusercontent.com/59988556/201534245-c13503a9-339c-4dca-b5f8-8e60902bbfd9.png)
![image](https://user-images.githubusercontent.com/59988556/201534250-228fa07a-3ed4-4fe6-96ba-7316304c7ca8.png)


