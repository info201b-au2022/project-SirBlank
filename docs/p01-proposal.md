# The Effect of Unequal Healthcare Resource Distribution on Life Expectancy: A Data Driven Approach

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
*Hospital closures*; *medical debts*; *health professional shortages*; *life expectancy*; *health inequity*.

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
1. What is the relationship between counties where hospitals close and life expectancy? This question helps us determine how hospital closures in counties can directly impact one's health and access to public healthcare.
2. Is there a difference between metro and non-metro medical debt? If so how significant is it? This question helps us understand, quantify, and visualize how drastic and far reaching health inequities between rural and urban areas can be.
3. What is the relationship between low health indicators and health professional shortages? This question helps us understand if the lack of health professionals in an area affects people's overall life expectancy and their access to public healthcare.

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
There are a few limitations we faced during different phases of our projects so far, and there are also some limitations we figure out that could potentially become challenging for our group. One limitation on our datasets, is that in debt in America dataset, it does not include the information about the race, and is only based on the racial makeup of zip codes within the area. For example, if 60 percent of the community were white, the population in the zip code would be considered white and vice versa. Therefore for our interactive graph later we will not be able to use race as a variable because it doesn't accurately represent the entire population, we will have use something else for variable such as metro or non-metro. Another limitation is that some counties do not have any data. This reveals how the dataset would definitely represent most of the country but not the whole. Our solution would probably be to delect the data of those counties for the other datasets so that all datasets match each others. Another limitation is the strength of the correlation we mention in our research questions. It’s hard to demonstrate the relationship between debt owed by Americans and hospital closure scientifically because there could be unknown variables that affect the outcome. Still, we could make approximate prediction with the correlation. However, all these limitations are small enough to be disregarded in determining the general relationships between the factors.

### Acknowledgements:
Thank you Ishita for answering our clarifying questions.

### References:
Alexander Carther, Kassandra Martinchek, Breno Braga, Signe-Mary McKernan, and Caleb Quakenbush (2022). *Debt in America* [Data set]. Accessible from https://datacatalog.urban.org/dataset/debt-america-2022.

Fitzhugh Mullan Institute for Health Workforce Equity. (n.d.). Health Workforce for Health Equity : Medical Care. LWW. Retrieved October 31, 2022, from https://journals.lww.com/lww-medicalcare/fulltext/2021/10001/health_workforce_for_health_equity.2.aspx

Health Resources & Service Administration Data Warehouse (2022). *Health Professional Shortage Areas_ Primary Care, by County* [Data set]. Accessible from https://data.hrsa.gov//DataDownload/DD_Files/BCD_HPSA_FCT_DET_PC.csv

Institute for Health Metrics and Evaluation (2022). *United States Mortality Rates and Life Expectancy by County, Race, and Ethnicity 2000-2019* [Data set]. https://doi.org/10.6069/B15B-0S14.

Levey, N. (2022, October 27). Why Black Americans are more likely to be saddled with medical debt. NPR. Retrieved October 31, 2022, from https://www.npr.org/sections/health-shots/2022/10/27/1131984451/medical-debt-racial-inequities

Pastorino, R., De Vito, C., Migliara, G., Glocker, K., Binenbaum, I., Ricciardi, W., & Boccia, S. (2019, October 1). Benefits and challenges of Big Data in Healthcare: An overview of the European initiatives. European journal of public health. Retrieved October 31, 2022, from https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6859509/

The Cecil G. Sheps Center for Health Services Research (2022). *183 Rural Hospital Closures since January 2005* [Data set]. Accessible from https://www.shepscenter.unc.edu/programs-projects/rural-health/rural-hospital-closures/




### Appendix A - Questions:
