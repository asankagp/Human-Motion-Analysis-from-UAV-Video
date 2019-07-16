# Human-Motion-Analysis-from-UAV-Video

![My image](https://github.com/asankagp/Human-Motion-Analysis-from-UAV-Video/blob/master/traj_plot.jpg)

**Purpose -** The purpose of this paper is to present a preliminary solution to address the problem of estimating human pose and trajectory by an aerial robot with a monocular camera in near real time.  

**Design/methodology/approach -** The distinguishing feature of our solution is a **_dynamic classifier selection_** architecture. Each video frame is corrected for perspective using projective transformation. Then, a silhouette is extracted as a Histogram of Oriented Gradients (HOG). The HOG is then classified using a **_dynamic classifier_**. A class is defined as a pose-viewpoint pair, and a total of 64 classes are defined to represent a forward walking and turning gait sequence. The dynamic classifier consists of (i) a Support Vector Machine (SVM) classifier C<sub>64</sub> that recognizes all 64 classes, and (ii) 64 SVM classifiers that recognize 4 classes each - these 4 classes are chosen based on the temporal relationship between them, dictated by the gait sequence. 

**Findings -** The solution provides three main advantages: (i) Classification is efficient due to dynamic selection (4-class vs. 64-class classification). (ii) Classification errors are confined to neighbors of the true viewpoints. This means a wrongly estimated viewpoint is at most an adjacent viewpoint of the true viewpoint, enabling fast recovery from incorrect estimations. (iii) The robust temporal relationship between poses is used to resolve the left-right ambiguities of human silhouettes. 

--------------------------------------------------------------------------
1. Run 'start.m' file.

2. In this repo, we have released only 100 images from the test data. We plan to make the complete dataset publicly available soon.
--------------------------------------------------------------------------

Download the dataset: https://asankagp.github.io/aerialgaitdataset/

--------------------------------------------------------------------------

If you use this code please cite the following paper:
 
Asanka G. Perera, Yee Wei Law, Ali Al-Naji, Javaan Chahl, (2018) 
"Human motion analysis from UAV video", International Journal of 
Intelligent Unmanned Systems, Vol. 6 Issue: 2, pp.69-92, 
https://doi.org/10.1108/IJIUS-10-2017-0012

email- asanka.perera@mymail.unisa.edu.au
