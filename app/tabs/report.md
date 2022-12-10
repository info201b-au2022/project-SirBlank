# Health Disparities Between Rural and Urban America: A Data Driven Approach

### Code name: Oglala Lakota

### Authors:
Sunghee Park: sxnghp@uw.edu\
Amber Wu: awu8@uw.edu\
Teerth Mehta: teertm@uw.edu\
Alex Cao: rcao1103@uw.edu

### Affiliation:
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

### Date:
Autumn 2022

### Abstract:
We are concerned with the relationships between hospital closures, medical debt, health professional shortages, and life expectancy, with a specific focus on how healthcare resource distribution affects healthcare outcomes. This is important because without clearly understanding where healthcare resources need to be reinforced and where health inequities are the most severe, we will not be able to take the first steps towards a healthcare system that works for all Americans. To address this concern, we intend to understand geographical differences in each of the above mentioned variables (hospital closures, etc.) and unearth statistical trends between variables that in turn help us draw conclusions in regards to the ways in which the different variables contribute to health outcomes across different geographies.

### Keywords:
*Hospital closures*; *medical debts*; *health professional shortages*; *life expectancy*; *health disparities*.

### Introduction:
For the past two years COVID-19 has ravaged communities across America. COVID-19 has highlighted the many short-comings of the American healthcare system, but none more so than the disparities Americans of different walks of life face when interacting with the healthcare system. However these disparities are not new at all, they have had an extensive history within the healthcare system and even after numerous efforts to understand these disparities and address them, they continue to remain one of the most pervasive problems that face the American healthcare system. One of the reasons this problem is so pervasive is because of the many different factors that affect an individual’s health, from the zip code they live in to the amount of debt they live in to the number of hospitals near them. Understanding how much these factors contribute to an individual’s health is a small step to addressing these inequities and that is exactly what this project is: a small step in addressing the inequities in healthcare by visualizing and connecting data.

### Problem Domain:
The problem domain that this project aims to address is that of healthcare disparities. While there has been much research that has already been conducted on this very problem domain, the way our project aims to address this is by specifically looking at how non-clinical components of a person’s life, things like their finances, the number of doctors and hospitals in their area, and the rurality of their residence end up affecting their overall health.

#### Project Framing:
In a perfect world, access to high quality healthcare would be a right. However, in the real world what we see is an unequal distribution of healthcare resources. This is where the data analysis housed within this project comes into play. We aim to understand what types of communities experience these disparities, what type of resources they lack, and the effect this lacking has on the healthcare of the residents of these communities.

#### Previous Work:
As described above, there has been extensive work that has been done to explore health inequities, and this project just intends to build on that work. For example, we understand that health equity is tied deeply to the makeup of the healthcare workforce and among many factors, one factor that stands out in this regard is the geographical distribution of the healthcare workforce (Fitzhugh Mullan Institute for Health Workforce Equity). Furthermore, we also see that the structuring of medical debt is highly inequitable along racial lines, with African-Americans carrying the majority of medical debt (Levey, 2022).

#### Human Values:
This project is dedicated to the wellness of other people, however, it's specifically dedicated to the human values of universal access and human dignity. We believe that data that affects one’s own health needs to be made available not just for the sake of transparency, but also for the sake of greater understanding. This means presenting data in a way that is understandable and approachable. We also believe that our project and problem domain are directly related to promoting human dignity, because if healthcare is a right, then as of now this right is being violated across America.

#### Direct and Indirect Stakeholders:
The direct stakeholders are people seeking medical assistance, health professionals working in hospitals, emergency healthcare responders, and hospitals. The indirect stakeholders are policymakers and the governments that determine the amount of funding and resources public hospitals receive.

#### Possible Harms and Benefits:
The benefits of displaying data on health equity in an accessible way include raising awareness of the overlooked issues that small, often rural communities face when taking control of their own healthcare. Another benefit of displaying data, relating to this subject, is the ability to identify relevant stakeholders in complex situations more easily and collaborate with them to produce evidence-based solutions (Pastorino et al., 2019).

A possible harm is that people might assume that there is a causational relationship between these factors from this data analysis. This project also does not represent people’s experiences with public healthcare and the effectiveness of its treatments.



### Research Questions:
1. How does life expectancy differ between metropolitan and non metropolitan areas? This question helps us find out whether an area is metropolitan, meaning advanced in economy, politics, size, population, and culture, could affect life expectancy on birth.
2. Is there a difference between metro and non-metro medical debt? If so how significant is it? This question helps us understand, quantify, and visualize how drastic and far reaching health inequities between rural and urban areas can be.
3. How do metropolitan counties compare to nonmetropolitan counties in the United States in regards to HPSA, Health Professional Shortage Area? This question helps us understand if the county designation has an effect in their health professional shortage area status.

### Datasets:

#### Rural Hospital Closures by Counties:
We chose the data set of the rural hospital closures since January 2005 because it answers the question of where the hospital closures were happening in rural areas. The dataset was collected by Cecil G. Sheps Center for Health Services Research ever since 2005. They were collected in order to see facilities that can no longer provide healthcare services, and the facilities no longer provide in-patient care, but continue to provide some healthcare services. The data collection was not funded. From the data, people living in the rural areas may be benefited, since it sheds light on rural hospital closures. Also, anyone researching the topic of hospital closures would be benefited from the data. The data is considered credible because they get their data from the analysis of Centers for Medicare and Medicaid Services data, information exchange with the National Rural Health Association and the federal Office of Rural Health Policy. We obtained the data through Google searching about hospital closures, and the source of the data is credited.


#### Medical Debt in America by Counties:

We chose to look at a dataset of average medical debt at the county levels because we wanted to know if one’s medical debt is a factor to rural hospital closures as we were speculating that hospitals cannot generate revenue if patients cannot afford or pay their medical bills.

These data are collected by Alexander Carther, Kassandra Martinchek, Breno Braga, Signe-Mary McKernan, and Caleb Quakenbush, the creators of the project “Debt in America”. They started this project because they wanted to show the debt differences that can reinforce the wealth gap between white communities and communities of color. They collected data from major credit bureaus from February 2022 and US Census Bureau’s American Community Survey from 2015 to 2019. The data collection effort was funded by the Annie E. Casey Foundation and the Ford Foundation. The data is trustworthy as the Urban Institute is a highly respected nonprofit research organization. Communities of color are likely to benefit from the data as the dataset shed light on the wealth differences between white communities and communities of color. We obtained the data by searching about medical debt in America on Google.

#### Healthcare Professional Shortages by Counties:
We chose the dataset on Health Professional Shortage Area in order to see where in the United States were struggling due to low medical healthcare staffing and were designated as HPSA, Health Professional shortage Area. The data was collected by HRSA, Health Resources & Service Administration, and has been collected since 2006, daily HRSA is funded with annual appropriations of $13.3 billion in their fiscal year, 2022.. They are used to decide whether or not the area is a HPSA. More than 34 federal programs depend on this data collection of HPSA designations. They use the data in order to determine eligibility or even as a funding preference.  From this, the areas that are HPSA will be benefited from the funds that are given based on the data. The data is trustworthy because not only the data itself is very recent but the HRSA is an agency of the U.S. Department of Health and Human Services which is an executive branch department of the U.S. federal government. We obtained the data through researching on Google, and we did credit the source of the data accordingly.



#### Life Expectancy at Birth in America by Counties:

We chose to look at the life expectancy at birth at the county level because we want to see if there is a difference in life expectancy between metro and nonmetro areas and to help identify the impact of living in a rural area to one’s overall health.

These data were collected by the Institute for Health Metrics and Evaluation (IHME) from the National Center for Health Statistics’ 2000-2019 data (https://www.cdc.gov/nchs/fastats/deaths.htm) of population and deaths data in the United States. This was collected in 2019 for the purpose of estimating mortality rates and life expectancy at the county level. This data collection was funded by National Institute on Minority Health and Health Disparities (NIMHD), National Heart, Lung, and Blood Institute, National Institutes of Health (NIH), National Cancer Institute (NCI) (United States), National Institute on Aging (NIA), National Institutes of Health (NIH), National Institute of Arthritis and Musculoskeletal and Skin Diseases (NIAMS), and the National Institutes of Health (NIH). This data is likely to benefit the minority communities as the data provides insights to health differences between different communities. This data is trustworthy because the National Institute on Minority Health and Health Disparities is a government health institute. We obtained the data by searching on Google and we did credit the source of the data.

#### Table of Datasets
|       | Rural Hospital Closures in America | Medical Debts in America | Health Professional Shortage | Life Expectancy at Birth|
|:------|:----------------------------------:|:------------------------:|:----------------------------:|:-----------------------:|
|Number of Observations|183|3137|3143|365940|
|Number of Variables|16|16|6|17|

#### Citations:
Alexander Carther, Kassandra Martinchek, Breno Braga, Signe-Mary McKernan, and Caleb Quakenbush (2022). *Debt in America* [Data set]. Accessible from https://datacatalog.urban.org/dataset/debt-america-2022.

Health Resources & Service Administration Data Warehouse (2022). *Health Professional Shortage Areas_ Primary Care, by County* [Data set]. Accessible from https://data.hrsa.gov//DataDownload/DD_Files/BCD_HPSA_FCT_DET_PC.csv

Institute for Health Metrics and Evaluation (2022). *United States Mortality Rates and Life Expectancy by County, Race, and Ethnicity 2000-2019* [Data set]. https://doi.org/10.6069/B15B-0S14.

The Cecil G. Sheps Center for Health Services Research (2022). *183 Rural Hospital Closures since January 2005* [Data set]. Accessible from https://www.shepscenter.unc.edu/programs-projects/rural-health/rural-hospital-closures/


### Expected Implications:
If our research questions are answered, this project will develop valid and reliable evidence that establishes the correlation between an individual’s health and healthcare resource distribution to help policymakers and governments better allocate funding and resources to the public healthcare system. If the datasets demonstrate a relationship between hospital closures and one’s life expectancy in the rural areas, policymakers will need to seriously consider and improve rural areas’ access to public healthcare. Policymakers will also need to find a solution to alleviate the medical debt for those who are struggling financially and have low health indicators. To combat rural hospital closures and health professional shortages, policymakers should also consider providing additional funding to rural hospitals to ensure that they have sufficient number of staffs to respond to patients.

### Limitations:
A limitation about our data sets is that there are counties that do not have any data. This will cause citizens residing in those counties to be misrepresented. However, this should not be a problem as the data sets will still acurately represent those groups of population at the state level. Another limitation is the variety of classifications of counties based on population. To address this, we decided to classify counties as metropolitan (50,000 or more) or non-metropolitan (less than 50,000) across all data sets to be consistent. 

### Findings:
The answers to all our questions posed in our project proposal are very clearly revealed in the different data visualizations and graphical encodings in this project. For example, comparing maps of different financial determinants of health, as seen in our interactive map on shiny, is that different trends dominate in different parts of the country. When we compare different boxplots and pie charts, we see again different aspects of our healthcare system being exposed and specifically the disparities in these different aspects being made much more clear graphically.

Our first question in our project asked how life expectancy differed between non-metropolitan and metropolitan areas. Based on both our interactive graphs and the box-plot in our exploratory data analysis we see that while there is no visible difference or large difference between the life expectancies at birth, there is still a difference and that difference is of only one year with metropolitan areas leading with 80.2 years at birth and non-metropolitan areas lagging with 79.2 years at birth.

Our second question in our project asked if there were differences in medical debt distribution across the country, and if so how significant. Our bar chart in our exploratory data analysis shows that in metropolitan areas the mean medical debt is $707.90 and it is $804.23 in nonmetropolitan areas. This means that the answer to our question is that there are differences in medical debt between metropolitan and nonmetropolitan areas. Furthermore, based on our interactive graphs we see that this high medical debt is mainly concentrated in the non-metropolitan regions of the south and midwest. These high levels of medical debt are correlated with the concentration of salary levels and a lack of insurance coverage in these areas along with the urbanicity status of states.

Our third question in our project asked what the status of health professional shortages is in different area classifications, metropolitan and non-metropolitan areas. This question helps us understand the disparities in health professional shortages which obviously will have an effect on the health outcomes of these areas’ residents. What we see from both our pie-charts and interactive pie-charts is that non-metropolitan or rural areas have much higher frequencies of entire areas being designated as shortage areas. Specifically, we can see that 73.46% of all nonmetropolitan areas are experiencing full shortages in medical professionals while we see only 47.2% of all metropolitan areas are experiencing full health professional shortages. This answers our question in the sense that non-metropolitan areas are worse off than metropolitan areas in terms of access to health professionals.



### Discussions:
Our findings are significant to consider because it reveals the lack of access to public health care in non-metropolitan areas. It develops valid and reliable evidence that establishes the relationship between each individual’s health and healthcare resource distribution. 

The first finding reveals that first, the average medical debt in both metro and non-metropolitan areas are very high, and yet the non-metropolitan areas have higher average medical debt than metropolitan areas. From this finding, the government and policymakers will need to take these into consideration which direction they will have to go when finding a solution to alleviate the medical debt for, if possible, all or those who are struggling financially and have low health indicators. 

From the second finding, it is concluded that the non-metropolitan area has a higher rate of Health Professional Shortage Area than metropolitan area. This explicitly reveals that healthcare is unevenly and unfairly spread across the states. This may be due to several different reasons such as lack of workforce in the area or the high medical debt that the hospitals in the area had closed down. It is true that it is impossible to make all non-metropolitan areas a non-health professional shortage area – in metropolitan areas, the health professional shortage area does exist, only at a lesser rate – but it would be possible for the government to provide them with more health professionals and additional funding to the hospitals in the area. 

Lastly, looking at the last finding, although there is no big difference in life expectancy at birth between metropolitan and non-metropolitan areas, the non-metropolitan area definitely has a lower number of life expectancy than metropolitan areas; the mean for metropolitan was about 80.2 years and the mean for non-metropolitan was about 79.2 years. Because the lower life expectancy is partly caused by the high medical debt and lower health professionals, to increase the life expectancy at birth, it is significant to alleviate the medical debt while increasing the number of health professionals in non-metropolitan areas.



### Conclusion:
Healthcare is always an important topic people are concerned about, especially for the past two years where COVID-19 has ravaged communities across America. People are concerned about it as COVID-19 has highlighted the many short-comings of the American healthcare system, mostly caused disparities between Americans and a lot of different factors. Our group believes that in order to clearly understand how we would be able to improve the healthcare system in America, we need to understand and address the factors that cause disparities.

This project discusses the inequities in healthcare by visualizing and connecting three different data, specifically highlighting the inequity between the metropolitan and non-metropolitan areas. People seeking medical assistance, health professionals working in hospitals, emergency healthcare responders, and hospitals would be greatly affected by the report as it proves the inequity in healthcare provision and further changes should be made to hospitals in metropolitan areas. 

Through the three interactive charts and a table, it is concluded that there is an apparent inequity between the metropolitan and metropolitan areas, especially between the number of health professionals in the area and the medical debt. The table shows that 9 out of 10 counties with the highest percentage of medical debt are non-metropolitan counties. We also noticed that all of the counties in the table are located in the Southern or Eastern United States. Our bar chart gives us two main insights, first that healthcare is expensive everywhere and second that healthcare in non-metropolitan areas tends to weigh more heavily on the patients in those counties. From the pie charts, we are able to conclude that the non-metropolitan area has a higher rate of Health Professional Shortage Area than metropolitan area. And with the boxplots, it appears that for metropolitan areas, the life expectancy on birth is averagely 80.2, while the number is 79.2 in non-metropolitan areas. 

It would be reasonable to conclude that the higher medical debt and the lower health professionals in the area take a part in lower life expectancy at birth in nonmetropolitan areas. As a citizen of the United States of America, healthcare is a basic human right and the right is being violated for people living in many areas. The cost or location of healthcare should not be the reason that prevents people from accessing healthcare services or going to the hospitals.



### Acknowledgements:
Thank you Ishita for answering our clarifying questions.

### References:
Alexander Carther, Kassandra Martinchek, Breno Braga, Signe-Mary McKernan, and Caleb Quakenbush (2022). *Debt in America* [Data set]. Accessible from https://datacatalog.urban.org/dataset/debt-america-2022.

Amy, J. (2022). Image of Southwest Georgia Regional Medical Center in Cuthbert, Ga., closing on Friday, Oct. 7, 2022. US hospitals are closing as demand for care increases. International Committee of the Fourth International. Retrieved December 9, 2022, from https://www.wsws.org/en/articles/2022/11/18/fdfc-n18.html. 

American Hospital Association. (2022). AHA report: Rural hospital closures threaten patient access to care. Retrieved December 8, 2022, from https://www.aha.org/news/headline/2022-09-08-aha-report-rural-hospital-closures-threaten-patient-access-care. 

Debt in America 2022. Urban Data Catalog. (2022, June 23). Retrieved December 8, 2022, from https://datacatalog.urban.org/dataset/debt-america-2022 

Fitzhugh Mullan Institute for Health Workforce Equity. (n.d.). Health Workforce for Health Equity : Medical Care. LWW. Retrieved October 31, 2022, from https://journals.lww.com/lww-medicalcare/fulltext/2021/10001/health_workforce_for_health_equity.2.aspx

Health Resources & Service Administration Data Warehouse (2022). *Health Professional Shortage Areas_ Primary Care, by County* [Data set]. Accessible from https://data.hrsa.gov//DataDownload/DD_Files/BCD_HPSA_FCT_DET_PC.csv

Institute for Health Metrics and Evaluation (2022). *United States Mortality Rates and Life Expectancy by County, Race, and Ethnicity 2000-2019* [Data set]. https://doi.org/10.6069/B15B-0S14.

Levey, N. (2022, October 27). Why Black Americans are more likely to be saddled with medical debt. NPR. Retrieved October 31, 2022, from https://www.npr.org/sections/health-shots/2022/10/27/1131984451/medical-debt-racial-inequities

Pastorino, R., De Vito, C., Migliara, G., Glocker, K., Binenbaum, I., Ricciardi, W., & Boccia, S. (2019, October 1). Benefits and challenges of Big Data in Healthcare: An overview of the European initiatives. European journal of public health. Retrieved October 31, 2022, from https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6859509/

Rural Health Information Hub. Rural Health Disparities Overview. (n.d.). Retrieved December 8, 2022, from https://www.ruralhealthinfo.org/topics/rural-health-disparities 

Scoring shortage designations. Scoring Shortage Designations | Bureau of Health Workforce. (n.d.). Retrieved December 8, 2022, from https://bhw.hrsa.gov/workforce-shortage-areas/shortage-designation/scoring

The Cecil G. Sheps Center for Health Services Research (2022). *183 Rural Hospital Closures since January 2005* [Data set]. Accessible from https://www.shepscenter.unc.edu/programs-projects/rural-health/rural-hospital-closures/




### Appendix A - Questions:
