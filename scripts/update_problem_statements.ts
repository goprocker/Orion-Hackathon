import fs from 'fs';
import path from 'path';
import crypto from 'crypto';
import type { TeamRecord, TeamMember, PaymentRecord } from '../src/types/orion';

// Raw lines from the PDF OCR
const rawLines = `
ORION-S0001 Innovex 3 Yasaswini Chilukuri yasaswinichilukuri09@gmail.com CSE -AIML Second Year Sathyabama Institute of science and technology Hiranya Pallerla Loshitha B Artificial Intelligence & Machine Learning
ORION-S0002 GirlsGotByte 4 S Darshini Jeya Shakthi darshini240906@gmail.com B.tech CSBS Third Year SRM INSTITUTE OF SCIENCE AND TECHNOLOGY Athmaja A PATEL DHARNI ARVINDBHAI URVI DEORE Open Innovation
ORION-S0003 Safegrid 6 Moses Sparjen K mosesspurgeon08@gmail.com ECE Second Year Sathyabama University Nandhini G Tamil selvi SV Sharveshwaran MS Rakshitha S Nithish abinav GK nithishabhinav3082@gmail.com Ece Second Year Open Innovation
ORION-S0004 TechXKuzhu 6 Thanishka Yogesh thanishka.ykb@gmail.com B.E CSE Second Year Sri Sairam Engineering College Lokeshwari R Surya S Nithish Kumar S Mithun V Madhu Karthikeyan S madhukarthikeyan.s.2025.ft@rajalakshmi.edu.in B.Tech Food Technology Second Year FinTech
ORION-S0006 Neuro Forge 6 Sarveshwar V A avssarvesh@gmail.com ECE Second Year St. Joseph's College of engineering Sathish D Sridharan R Yaswanth S Shrika M Sanlin Benzer E sanlinbenzer@gmail.com ECE Second Year Sustainability / ClimateTech
ORION-S0007 HEXAFLUX 6 Sakthi lakshmi G laksh.sakthi07@gmail.com B.E CSE Second Year Sathyabama institute of science and technology Sarifa Afrin M Sahaya Ancy J Roshini Infenta S Sanjiv Andrew Sanjai G sanjaiganesh3004@gmail.com BE CSR Second Year Open Innovation
ORION-S0008 Deadline Dodgers 5 E Gogulnath ellappangogul@gmail.com BE CSE DS Second Year Sathyabama Institute of science and technology Dharshan Y Divyanth J Anish Joshua V Vishal Web / Mobile Development
ORION-S0009 CodeNova 6 Aditya P S psaditya62@gmail.co B.E. Computer Science and Engineering Third Year Vel Tech High Tech Dr Rangarajan Dr Sakunthala Engineering College Neha M Asmitha P Danisha K Devadharshini S Buvana V B.E. Computer Science and Engineering Third Year Open Innovation
ORION-S0010 LOGIC LORDS 5 JERIN N jerinnoble0223@gmail.com Information Technology Second Year Easwari Engineering College INIYAVAN S JAIDEV SP JAI AADHITH KALAISELVA Sustainability / ClimateTech
ORION-S0012 Nexyra 4 B.ARVIND arvindvijay2978@gmail.com B.TECH INFORMATION TECHNOLOGY Third Year P.S.R. Engineering College K.BHARATHAN B.AKASH M.MARI SELVAM ORION-PS-04: Open Innovation Track
ORION-S0013 ARC 5 Yuvaraj K L yuvaraj.k.l2828@gmail.com BTech CSE Second Year Srm institute of technology Trichy dharshan T R charish P S haris ahmed R staffen G ORION-PS-04: Open Innovation Track
ORION-S0014 Tech Larper 3 Farnas.B farnas1706@gmail.com B.Tech [ARTIFICIAL INTELLIGENCE AND DATA SCIENCE] Third Year BSA ABDUR RAHMAN Crescent institute of science and technology Jesran Mohamed Noorul Haq M ORION-PS-04: Open Innovation Track
ORION-S0015 Adengappa naalu peru 4 N.Sham Venkat shamvenkat15@gmail.com B.Tech AI&DS Third Year Anand Institute of Higher technology A.Vinish S.Robin kishor M.Vinayagam ORION-PS-04: Open Innovation Track
ORION-S0017 SOLEX 5 Suryaprakash S sprakash36366@gmail.com ECE Third Year KIT-KALAIGNAR KARUNANIDHI INSTITUTE OF TECHNOLOGY, COIMBATORE Yuvega N Naveena A Tamilarasan S Hariharan I ORION-PS-04: Open Innovation Track
ORION-S0018 Travixa 4 Lovinsha lovinsha08@gmail.com BE CSE AIML Second Year Sathyabama institution of science and technology Suriya kiran Hari balan Ragul ORION-PS-04: Open Innovation Track
ORION-S0019 Team Verse 5 Naveenkumar P naveenkumarnk08072006@gmail.com CSE Fourth Year Sri sai ram institute of technology Yazhini G A Deepika D Nivetha E Akshaya R ORION-PS-03: SYLVASENSE
ORION-S0020 Tech titans 6 Deekshith. P deekshithpadma56@gmail.com AIML/Hackathon Third Year Manakula Vinayagar institute of technology Kamalesh P KAMALADHASAN. M Prakashraj.V Keerthivarman.G Ramanan.R rrmanan2006@gmail.com AIML/HACKATHON Third Year ORION-PS-04: Open Innovation Track
ORION-S0021 QRYVEXA 3 SENTHAMIZH SELVAN.V thamizhthamizh996@gmail.com Artificial Intelligence and Data Science Third Year Anand Institute of higher technology RAHUL.M YUGA BHARATHI.P [1] ORION-PS-02: LEXVAULT
ORION-S0022 Hackademics 6 Akshay Kumar N akshayroxx8@gmail.com CSE AIML Third Year SRM Institute of science and technology Devaraj M Pranav Narayan MS Aadith Geeth Mohan Srinivasan S E Harikrishna harielamvazuthi@gmail.com CSE AIML Third Year ORION-PS-04: Open Innovation Track
ORION-S0024 ByteForge 2 Chandini Sundaran chandinisundaran5@gmail.com Btech CSE Cybersecurity Second Year SRM Institute of Science and Technology Kanishka K ORION-PS-04: Open Innovation Track
ORION-S0025 REPLICANTS 5 Shirish Babu N shirishbabu08@gmail.com CSE-AIML Second Year Sathyabama Tanishq Kumar Aashin Nibhu Gladiwin A Manish K ORION-PS-04: Open Innovation Track
ORION-S0027 CYPHERFORGE 6 Arunadevi.S arunaads0002@gmail.com AIDS Second Year RMK College of Engineering and Technology Divyadharshini Bhoomika.P Anisha Lakshmi.G.S Monisha.S Pradhiksha.D 25ad116@rmkcet.ac.in AIDS Second Year ORION-PS-02: LEXVAULT
ORION-S0028 Hacker Men 6 BHARANIDHARAN S bharanibd2007@gmail.com CSE (Cyber Security) Third Year SRI SAIRAM INSTITUTE OF TECHNOLOGY HARIKUMAR E KAMALESH K ASHWIN PERUMAL S RYUVAN SHANKAR B ARVIND A sitl25sc02@sairamtap.edu.in CSE (Cyber Security) Third Year ORION-PS-04: Open Innovation Track
ORION-S0029 adhiradi boys 4 Pushparaj J pjpushparaj101@gmail.com B.E - CSE Third Year Sathyabama Institute of Science and Technology Kamal T Monish M Nimmanagoti Tharun Kumar ORION-PS-01: FLOATCHAT
ORION-S0030 Error 404 4 S.Sai Dolasa [2] saidolasa06@gmail.com [3] ece [4] Third Year RMK college of engineering and technology. Chokkani.Vineela [5] R.Nandu Reddy A.Joshika Reddy L.Deepika ORION-PS-04: Open Innovation Track
ORION-S0031 Hack hawks 5 GOPIKRISHNA S gopikaru0090@gmail.com AIML Fourth Year PRATHYUSHA ENGINEERING COLLEGE KISHOR KUMAR s Salman S YOGESHWAR K VISHNU B RAGHUL J jraghul134@gmail.com CYBERSECURITY Third Year ORION-PS-04: Open Innovation Track
ORION-S0033 Code Blooded 2 Jahnavi Mogarala mogaralajahnavi9@gmail.com Btech Computer Science Engineering Third Year SRM INSTITUTE OF SCIENCE AND TECHNOLOGY RAMAPURAM CHENNAI Prathiksa G ORION-PS-04: Open Innovation Track
ORION-S0034 Little ghosts 4 Gokul chowdry S gokulchowdrychowdry@gmail.com B.TECH/CSE CORE Third Year SRM institute of science and technology Vishal Anugraha PJ Sanjana Rajasekar ORION-PS-03: SYLVASENSE
ORION-S0035 Apprentice 6 Navya M navyastudy18@gmail.com BE CSE Fourth Year Sathyabama University Deepadarsni S Hareesh Govind Hariharan D Guru Prasath Balaji M balaji20082005@gmail.com BE CSE Fourth Year ORION-PS-01: FLOATCHAT
ORION-S0036 MindMesh 5 Mrityunjay Krithick M mrityunjaykrithick@gmail.com Bsc maths Third Year Sathyabama Institute of Science and Technology Oviya S Paari S Sasmita S Thanmaysree K ORION-PS-04: Open Innovation Track
ORION-S0037 Bug syndicate 5 Megesh L megeshl2007@gmail.com CSE Second Year Sri Sairam Engineering College Rajiv G Soma Sundari N Dhanalakshmi Bhavatarikha Lakshmanan Saravanan ORION-PS-03: SYLVASENSE
ORION-S0038 405 decoders 5 Potnuru Prasanth kumar prasanthkumarpotnuru17@gmail.com B.Tech(CSE)AI and ML Second Year AMET University Korada venkat sai Dhanush kayala Sai Gangadhar Adapa Rajendra V ORION-PS-04: Open Innovation Track
ORION-S0039 Byteforge 4 Keshika Valli S keshika.valli@gmail.com B.E CSE Second Year Easwari Engineering College Kritya K Keerthana E Joshitha S ORION-PS-02: LEXVAULT
ORION-S0040 Algoryx 5 Amirtha varsini R amirthaj2007@gmail.com Btech CSE Second Year SRM institute of science and technology , Trichy Ramkarthikeyan G Tharshan M Kowsik Raja S Sastiga Sri H ORION-PS-04: Open Innovation Track
ORION-S0042 THAMIZH ARIGNARGAL 4 Muhammadu Rasheeq J M muhammadurasheeqjm.ece2025@citchennai.netElectronics and communication engineering Second Year Chennai institute of technology Sai saran A V Mamata Niranjana D ORION-PS-04: Open Innovation Track
ORION-S0044 Deadline Warriors 6 A.R Akshaya Kruthik akshaykruthik7@gmail.com CSE Second Year R.M.D. Engineering College Dheeraj Abhay. R Avinash. R Dhanuja. J S. SAKTHI SRI Ashvin Prasad. k ashvinprasad22@gmail.com CSE Second Year ORION-PS-04: Open Innovation Track
ORION-S0045 PROTECTECH 4 Deveshwar S deveshwar.s.2025.it@rajalakshmi.edu.in B.Tech Information Technology Second Year Rajalakshmi Engineering College Sri Hari S Vijay Karthick S Sree Vishal K S ORION-PS-01: FLOATCHAT
ORION-S0047 Alpha Minds 6 Vasundra S vasundra25112007@gmail.com B.tech Artificial intelligence and Data science Second Year Sri Venkateswara College of engineering, Sriperumbudur (SVCE) Vidhyaa Vardhani Ramesh Narmatha R Parvada Vardhni S Niranjana S Aishwarya aishuruthva@gmail.com B.E Computer Science and Engineering Second Year ORION-PS-04: Open Innovation Track
ORION-S0048 BytePulse 6 Sadhana V sadhanavengatachalam@gmail.com cse Second Year Sns college of technology Rithika R Ragavi S pranika Shree C Poornaa V Prasanambika prasanambikas@gmail.com CSE Second Year ORION-PS-01: FLOATCHAT
ORION-S0050 Byte me 6 Shivani shivanigeeth24@gmail.com BE-CSBS Second Year Sathyabama institute of science and technology Jane Marria Harriet Niveditha S Aimy Grace P George Jeshvina Emerald Jhanavarshan AM Jv.am229@gmail.com BE-CSBS Second Year ORION-PS-01: FLOATCHAT
ORION-S0051 Point Break 6 Chandru M chandrum.cse2025@citchennai.net Computer Science and Engineering Second Year Chennai Institute of Technology Jaya Karthick R Harish S Darshan K Jovitha E Harini BB harinibb.aids2025@citchennai.netArtificial intelligence and Data Science Second Year ORION-PS-01: FLOATCHAT
ORION-S0053 Team Rogers 6 Vijayalakshmi.V vijayalakshmilaks2556@gmail.com Bio Medical Engineering (BME) Third Year Rajiv Gandhi college of engineering and technology HendryPualDhinakaran.S Faazilah A.L. Thirumalini.S Hemachandran S Nitesh kumaar V niteshkumaar042008@gmail .comBME Second Year ORION-PS-04: Open Innovation Track
ORION-S0055 Cyber Warrier 6 Jaya Suriya k dr.jayasurya1611@gmail.com Cyber security Second Year IFET COLLEGE OF ENGINERING Soorya Subash KATHIJA.M R.Renuga Devi RIGASHINI.s rigar920@gmail.com 9952339657Cyber security Second Year ORION-PS-04: Open Innovation Track
ORION-S0056 Interstellar 6 Farhan Ur Rahman M farhanurrahman26@gmail.com CSE ( Cyber Security) Third Year Easwari Engineering College Aiman Zulaiha M M S Adithyan Benoy V Rathna Priya S Srikar B V Sushmitha E malaieiu511@gmail.com CSE ( cyber security) Third Year ORION-PS-04: Open Innovation Track
ORION-S0058 Codeflux 6 Praveena S praveenachithra2006@gmail.com BTech Artificial intelligence and data science Fourth Year Dhanalakshmi college of engineering T Vignesh Tamizharasi K Yuvathi P Sathiya nishka Srinivasan V BTech Artificial intelligence and data science Fourth Year ORION-PS-04: Open Innovation Track
ORION-S0059 Elite 2 Madhumitha Manivannan madhu357mani@gmail.com Information technology Third Year Velammal engineering college Devatharshini J ORION-PS-01: FLOATCHAT
ORION-S0060 Scarlet force 5 [6] Madhumitha S madhumithasrinivasan2976@gmail.com Artificial Intelligence and Data Science Third Year Saranathan college of engineering Janani R Archaya U Harini S Brindhasri S ORION-PS-03: SYLVASENSE
ORION-S0061 Aquasense 4 Ratheesh M ratheesh.m.2025.cse@rajalakshmi.edu.in BE ComputerScienceEngineering Second Year Rajalakshmi Engineering College Ravindran G RishiKumar Raajavarshan S.M ORION-PS-01: FLOATCHAT
ORION-S0062 OPTIPARK SYSTEMS 3 GOMATAM TRISHNA HAASINI gvkguru@gmail.com ECE-DS/BTECT Second Year SRM INSTITUTE OF SCIENCE AND TECHNOLOGY TULIKA JAISWAL MOKSHITHA KAKARLA ORION-PS-04: Open Innovation Track
ORION-S0063 TECH TITANS 6 Ram Prakash S ramprkash.s07@gmail.com Electronics and communication Engineering Third Year Dhanalakshmi Srinivasan college of engineering Coimbatore Indhar A SANJAY S SHRI SANTH SUBASH NRajathiruvarasu v Sriharan A Sriharan796@gmail.com ELECTRONICS AND COMMUNICATION ENGINEERING Third Year ORION-PS-04: Open Innovation Track
ORION-S0064 STACKS 5 Praveen R praveen.r.2025.cse@rajalakshmi.edu.in Department-CSE Second Year Rajalakshmi Engineering College Rithikka P Ramya R Ranjeet P.I Akash S - - - - ORION-PS-04: Open Innovation Track
ORION-S0065 LeafLogic 6 Swathika S swathikasivagurunathan747@gmail.com B.E.CSE Third Year Sri Venkateswara College of Engineering P Dhivyasri Irfanaa Parveen M Yoga Varshini M Nandanaa devi A N Keerthana M km576277@gmail.com B.Tech. IT Third Year ORION-PS-03: SYLVASENSE
ORION-S0066 DeeBug 5 Ronak. N iamronakn@gmail.com Btech CSE Fourth Year Hindustan Institute of technology and science Faheem Udheen Lokesh Kumar Aravindakshan Thamilelelan None None None None ORION-PS-04: Open Innovation Track
ORION-S0067 NEXERA 4 Akshay Kumar P.V. akshaykumarpv047@gmail.com Artificial Intelligence and Machine Learning Second Year KCG College Of Technology Trinab Shan Harish K. Seyon Ann Shibu ORION-PS-04: Open Innovation Track
ORION-S0068 Tech Titan 6 M.HARSHINI 99250040317@klu.ac.in Computer science and engineering Second Year Kalasalingam Academy of Research and Education Harini P Iniya Alies Rasma M Jeyashree S Kanika A I Jai Shree M 99250040314@klu.ac.in Computer science and engineering Second Year ORION-PS-04: Open Innovation Track
ORION-S0069 TECHNO BRATS 6 Sruthi R sruthirajagopal02@gmail.com Electronics and communication engineering Third Year SRM Easwari Engineering college Thridev V M Srinidhi kruthiha G Vishnu Vedant DevanandSriram V Sudarshan A J ajsudarshan1807@gmail.com Electronics and communication Engineering Third Year ORION-PS-04: Open Innovation Track
ORION-S0070 Team_Name_26 4 Sai Krishna K J 2024ad0765@svce.ac.in AI & DS Third Year Sri Venkateswara College Of Engineering Shreya Sivakumar Ananthika S Nilavadhani GS ORION-PS-04: Open Innovation Track
ORION-S0071 Bama Boyz 6 Arjun arjunguvaraj1982@gmail.com BE CSE AI Second Year Sathyabama Institute of science and technology Afnan Hussain k Pranay Sarvesh Hasim Guru prasath imguru2007@gmail.com BE ECE Second Year ORION-PS-04: Open Innovation Track
ORION-S0072 Femmora 6 Vaibhavashakthi R vaibhavashakthi@gmail.com AI&DS Fourth Year V.S.B Engineering College,Karur Varshitha R Sherlin Neha A J Suryapriya A G Harini S Sornambiga S sornambiga.s@gmail.com AI&DS Fourth Year ORION-PS-04: Open Innovation Track
ORION-S0073 LOGIC LEGIONS 6 SIVAM P [7] 1011SIVAM.P@GMAIL.COM [8] BE CSE Second Year SATHYABAMA INSTITUTE OF SCIENCE AND TECHNOLOGY MOHITHRA [9] Srivachan c s Siva Ranjan S Anika Ambika ambikajay09@gmail.com BE CSE Second Year ORION-PS-04: Open Innovation Track
ORION-S0074 VisionX 6 Yazhini B yazhinibala742@gmail.com BE CSE Third Year Sathyabama University Dharshini P Bhavana Y Kanuri Manobhi AbhilashPoojitha G Nandhini Y yarabolunandini1@gmail.com BE CSE Third Year ORION-PS-04: Open Innovation Track
ORION-S0075 The imposter 5 Likith Krishna J likithkrishnaj07@gmail.com CSE Second Year Chennai institute of technology B Lakshman Rishi S Charan Josh A Jagadhiswaran K ORION-PS-04: Open Innovation Track
ORION-S0076 Kalephor 6 Shivani SK shivaniisk25@gmail.com BE CSE AI Second Year Sathyabama university Rakhesh Anand RA paul bryton raj Pon Vijayalakshmi Ramya KN Padmavathy padhmavathy.250291@cse.ritchennai.edu.in BE CSE Second Year ORION-PS-02: LEXVAULT
ORION-S0077 AgriVanguard 5 Thodupunuri Sai Charan saicharan02117@gmail.com Computer Science and Engineering / B.Tech Third Year CMR College of Engineering And Technology, Hyderabad Akkala Rahul Reddy Nalla Shreekar Maramreddy Aakash Reddy Podugu Harish ORION-PS-04: Open Innovation Track
ORION-S0078 Team Synergy 6 Nirmala Devi NS nirmaladevi.sripri@gmail.com Computer Science and Engineering Second Year SRI MANAKULA VINAYAGAR ENGINEERING COLLEGEE Divya Mithra A Sanjay Jeswin Samuel P Nirmal Kumar N S nirmalkumar.sripri@gmail.com Computer Science and Engineering Second Year ORION-PS-04: Open Innovation Track
ORION-S0079 Biobytes 6 S A Srikanth biogeneticsaim08@gmail.com Bsc Bioinformatics Second Year Sri Ramachandra Engineering and Technology Sherina K S Haniya.T Rakshana A Velu.E Taranesh S e6125013@sriher.edu.in Bsc Bioinformatics Second Year ORION-PS-04: Open Innovation Track
ORION-S0080 JACK HACKROV 5 VISHWA I i.vishwa2006@gmail.com B.TECH - ARTIFICIAL INTELLIGENCE AND DATA SCIENCE Fourth Year NEW PRINCE SHRI BHAVANI COLLEGE OF ENGINEERING AND TECHNOLOGY SURYA BC KILLIVALAVAN V MOHAMMED ASIK T SAKTHIVEL S ORION-PS-04: Open Innovation Track
ORION-S0081 IMPACT CODERS 6 Mohamed Aaseef M mmohamedaaseef@gmail.com B.Tech- CSBS Third Year PANIMALAR ENGINEERING COLLEGE Manoj R Saravanakumar G Sabarish J Shafeeq S Rohith V K rohith.kalyanam@gmail.com B.Tech- CSBS Third Year ORION-PS-04: Open Innovation Track
ORION-S0082 Brain Byte 4 Aditi Phulre ap8586@srmist.edu.in BTECH CSE Core Second Year SRM Institute Of Science And Technology Aditya Swaroop Kavya Singh Bhavay Mittal ORION-PS-03: SYLVASENSE
ORION-S0083 404 Brain Not Found 4 HARISH R harishravichandran1090@gmail.com BE CSE (AIML) Second Year SRM TRP ENGINEERING COLLEGE TIRUCHIRAPALLI DINESH RAJ B RITHIN RS AJAY PRABU RK ORION-PS-04: Open Innovation Track
ORION-S0084 TOOTHPASTE EATERS 3 RAJDEEP MAHADEV KULKARNI rk9127@srmist.edu.in networking and communications Second Year SRM University Ayush Bidwai Madhur Grover ORION-PS-04: Open Innovation Track
ORION-S0085 Mission:I'm-Possible Oxygen 5 Jai ganapathi.S.B sbjaiganapathi@gmail.com BE CSE AIML Second Year sathyabama institute of science and technology Harish.T Bolleboina Yashashwini Yadav Anya Angel Abinaya S ORION-PS-01: FLOATCHAT
ORION-S0086 SHERLOCK 5 Sai Aditiyaa R S saiaditiyaa07@gmail.com CSE Third Year RMK ENGINEERING COLLEGE Saravana Prasath P KElakkiya K Vrithika Sri Sarath Chander M ORION-PS-03: SYLVASENSE
ORION-S0087 PERCEPTRON 6 Sanjai R sandysaniit0508@gmail.com Computer science and business systems Third Year Panimalar engineering college Yogapradeep B Sabarish R Sengan s Vignesh R Suriya M sanjairavichandran2005@gmail.comComputer science and business systems Third Year ORION-PS-04: Open Innovation Track
ORION-S0088 core signal 6 prasanna kumar prasannakumar2564@gmail.com ECE Third Year Easwari engineering college praveen kumar Sanjeeth Nivetha Monika Sabharish gsabharish@gmail.com ECE Third Year ORION-PS-03: SYLVASENSE
ORION-S0089 Technova 4 S.Lakshaya lakshayasri123@gmail.com CSE Second Year Dhaanish chennai college of engineering Maha Lakshmi. G Raevan karthik Padmashree E K ORION-PS-04: Open Innovation Track
ORION-S0090 Fight club 6 M. SHEIK SHAHIN sheikshahinm@gmail.com Artificial intelligence and data science Second Year DR . NGP INSTITUTE OF TECHNOLOGY VINAYAK YUDHANU S STEFIN SURYA R SANJAY MURUGAN M TEJASWINI VINOTHINI 25ad118@drngpit.ac.in artificial intelligence and data science Second Year ORION-PS-04: Open Innovation Track
ORION-S0091 NEXORA 6 AGILESH M agileshmds@gmail.com B tech Ai ds First Year Academy of maritime education and technology GOWTHAM A Mohammad tharif THOTA YUVASENA Sakthipriya B Indujaa k indujaakarthikeyan3@gmail.com B.tech cse First Year ORION-PS-04: Open Innovation Track
ORION-S0092 Impact warriors 4 V DIVYESH divyesh0503@gmail.com B Tech ECE Second Year SRM INSTITUTE OF SCIENCE AND TECHNOLOGY RAMAPURAM R V SENA VARSHAN GOWTHAM S YESHWANT C ORION-PS-04: Open Innovation Track
ORION-S0093 CodeMonkeys 5 Hari Vishva S harivishva008@gmail.com Mtech integrated Software engineering Second Year Vellore Institute of Technology Yuvaraj H Ahilesh Guru S K Monasri Devisri K ORION-PS-03: SYLVASENSE
ORION-S0094 Techmates 3 Samitha. K Samitha.23ai@npsbcet.edu.in AI&DS Fourth Year New prince shri bhavani college of engineering and technology Nandhini. V Sreenidhi. S ORION-PS-04: Open Innovation Track
ORION-S0095 SALTVISIONAI 4 Mohammed Emtheyas S imamsyed20077@gmail.com B.E CSE Second Year RATHINAM TECHNICAL CAMPUS DHANALAKSHMI K Benadict thomas O.J Lingesh M ORION-PS-04: Open Innovation Track
ORION-S0096 Nex 6 6 DILIPAN P dilipansuguna@gmail.com B.Tech Artificial Intelligence and Machine Learning Third Year Manakula Vinayagar Institute of Technology, Puducherry Sadhish R Rashena l Kalaimathi G Keerthisha R Joshitha S sjoshitha76@gmail.com B.Tech Artificial Intelligence and Machine Learning Third Year ORION-PS-03: SYLVASENSE
ORION-S0097 SPIDEYVERSE 4 Hemamalini K hemamalini1415@gmail.com Computer Science and Engineering Fourth Year Anand Institute Of Higher Technology Venkat Yokash K PUGAZHARASI K Sandhya B ORION-PS-01: FLOATCHAT
ORION-S0098 Quantum Force 6 B Gopinath bgopinath0825@gmail.com Information Technology/B.Tech Third Year Easwari Engineering College Kumaran S Kathikeyan A Kawsik M Jitenra Rajan V Jones Abhishek jonesabishek839@gmail.com Information Technology/B.Tech Third Year ORION-PS-04: Open Innovation Track
ORION-S0099 Riot 4 P. Pragathy pragathydharshu@gmail.com B.tech cse AIML Second Year Hindustan institute of technology and science Lohit Aadhil shajahan Siddhi vinayak ORION-PS-04: Open Innovation Track
ORION-S0101 FLOWPILOT 5 Pranosh M pranosh286@gmail.com Computer Science and Engineering Third Year Panimalar Engineering College Praveen S Rahim Khan S Prajan M Rahul S ORION-PS-01: FLOATCHAT
ORION-S0102 SYNC SQUAD 6 MOHAMED RIYASDEEN I sec25am064@sairamtap.edu.in CSE(AI&ML)) Second Year SRI SAIRAM ENGINEERING COLLEGE MOHAMMED ASIF N VARSHINI S ANSHIGA R PREMA LATHA E V JEEVAN S sec25am081@sairamtap.edu.in CSE(AI&ML) Second Year ORION-PS-04: Open Innovation Track
ORION-S0103 TENSOR TITANS 5 Jessica J jessicashankar522@gmail.com B.Tech AI&DS Second Year Easwari Engineering College Kanisha Devi S Harsha S Meena Raj M.G Kavya A ORION-PS-03: SYLVASENSE
ORION-S0104 KernelPanic 6 Aaruran. K aarurank35@gmail.com Information Technology Third Year Rathinam Technical Campus Abiraj.K Ajay.S Balamurugan.S Dhinesh.N Devavarnine.M devavarninemurugesh@gmail.comInformation Technology Third Year ORION-PS-04: Open Innovation Track
ORION-S0105 OMEGA 3 R RITHWIK rithwikreddy1406@gmail.com ECE/B.E Second Year SRI SAI RAM ENGINEERING COLLEGE C SHRAVAN KHANAL T kirthik ORION-PS-04: Open Innovation Track
ORION-S0106 Binary Titans 2 M.Madhuri madhurimylu2007@gmail.com CSE Third Year Panimalar Engineering College R. Shivaram ORION-PS-04: Open Innovation Track
ORION-S0107 NEXO 2 Ashwath M ashwathmcse2024@jerusalemengg.ac.in BE CSE Third Year Jerusalem college of Engineering, Chennai G Dhanalakshmi ORION-PS-04: Open Innovation Track
ORION-S0108 FNATIC 6 Leema S leemas204@gmail.com Artificial Intelligence and Data Science Third Year SRM Easwari Engineering College Divesh N Mrudhula B Abhinava Ashwin R Mohammad Ejaz M Mukeshkumar S mukeshkumarsaravanan07@gmail.com Information Technology Third Year ORION-PS-01: FLOATCHAT
ORION-S0109 TOUCH GRASS 6 TK DHARMESH KUMAR Dharmeshthakkun14@gmail.com B.tech CSE(AI&DS) Second Year Vels university SAMYUKTHA.V SRUTHI.S M.BHAVESH NATH PB PRANAV RAM P.SRI PRIYAN sripriyan2107@gmail.com B.tech AI&DS Second Year ORION-PS-04: Open Innovation Track
ORION-S0110 Codex 6 Praveen S sankarganesh8061@gmail.com AIADS Second Year Easwari engineering college Mohammed Thamzil SMonish M Nirubanraaj J Muthu durai S Mohamed Aathif Jailani S 310625243131@eec.srmrmp.edu.inAIADS Second Year ORION-PS-04: Open Innovation Track
ORION-S0111 Arvion 6 Pranesh Mithun G S praneshmithung.s@gmail.com bachelor of engineering in computer science engineering Second Year Sathyabama University Nishmitha JS NithyaShree T Prithvi Kumaran R Nivetha S Prasanna Venkat G prasannavenkatganesh@gmail.combachelor of engineering in computer science engineering Second Year ORION-PS-04: Open Innovation Track
ORION-S0112 Vaishnavi devi G 3 Vaishnavi devi G vaishnavidevi309@gmail.com Cse Third Year Prathyusha engineering college Thejesvani S S G Yogitha ORION-PS-04: Open Innovation Track
ORION-S0113 NOVARYN 5 Barathi Sankar M barathisankar98@gmail.com Computer Science and Engineering Third Year Vel Tech High Tech Dr. Rangarajan Dr. Sakunthala Engineering College Jeevadharani VG Janani C Jeevitha V Dhanalakshmi S ORION-PS-04: Open Innovation Track
ORION-S0114 THE HEXA GEN 5 HRITHISHVAR hrithish316@gmail.com B.E CSE Second Year SATHYABAMA INSTITUTE OF SCIENCE AND TECHNOLOGY LOKESHWARAN KAVYASRI RITHIKASRI HARINI JAISHANKAR ORION-PS-04: Open Innovation Track
ORION-S0115 KernelZero 6 Priyan priyan123xyz@gmail.com Computer science (Core)/ B-Tech Third Year SRM Institute of Science and Technology ,Kattankulathur Arjjun S Sathappan PL Bala Tharun S Saarvin GP Raghul S raghulsaba3007@gmail.com Computer Science(Core)/ B-Tech Third Year ORION-PS-04: Open Innovation Track
ORION-S0116 Codenova 5 Praveena k praveenakannan193@gmail.com Aids Second Year Rmkcet Prithika p Ponmathi i Ponmani M Janani S ORION-PS-01: FLOATCHAT
ORION-S0117 Masterminds 4 Greeshma tarlana greeshma.tarlana@gmail.com BE-CSE-AI Second Year Sathyabama institute of science and technology Pragna boddu Haripriya Manikanta.G ORION-PS-03: SYLVASENSE
ORION-S0118 Jarvis 6.O 5 Roshan G roshan.devcodes@gmail.com Information Technology Second Year SRM Valliammai Engineeering College Sriabirami V Saran E Praveen raj V [10] Vidula C ORION-PS-04: Open Innovation Track
ORION-S0119 Veridia 4 Nadhiv Karuppuswamy nadhiv.ksun@gmail.com BE Computer Science Core First Year Sathyabama Institute of Science and Technology Mohammed Anas M.A ROSHAN SANTHOSH K ORION-PS-03: SYLVASENSE
ORION-S0120 FutureCode 3 Kevin Harris kevin.harris.leo@gmail.com Artificial Intelligence and Data Science Second Year Sathyabama Institute of Science and Technology Keerthi Shri Lakshikanth ORION-PS-04: Open Innovation Track
ORION-S0121 Team trinity 5 Sudharsan R sudharsanr2306@gmail.com B tech IT Third Year SNS college of technology Kavyasri P Bavasree R Pravin kumar D Jeganath Kumar S ORION-PS-04: Open Innovation Track
ORION-S0122 Byteforce 5 Kishorekumar [11] kishorekumar15122007@gmail.com Information technology Second Year Sri Manakula Vinayagar Engineering college Yogavin Rishiraj Rajeshwar Divagar ORION-PS-04: Open Innovation Track
ORION-S0123 KNIGHT CODERS 2 Hareesh VN hareeshvn.1609@gmail.com Computer Science Engineering Second Year Nxtwave Institute of Advanced Technologies Hevan Harish LM ORION-PS-04: Open Innovation Track
ORION-S0124 Hack Elite 3 OMSAIVAMSI V 25ad185@rmkcet.ac.in B-TECH AI&DS Second Year RMK College of Engineering and Technology Bala Adithya S U Gnanaprakasam C ORION-PS-04: Open Innovation Track
ORION-S0125 Neural Ninjas 5 Theshna R theshna23@gmail.com B. Tech/CSE Second Year SRM Institute of science and technology Amala abisha J Rithika V Shahel Netha M Jennet Pauline D ORION-PS-04: Open Innovation Track
ORION-S0126 Astrivex 3 Sree Harsana K K [13] sree.harsana@gmail.com ECE Second Year Nandha Engineering College,Erode Rhaghav C Pon Nivetha M Null NULL NULL NULL NULL NULL ORION-PS-04: Open Innovation Track
ORION-S0127 HEXAverse 6 Pooja Kumar poojakumar638359@gmail.com AI&DS Second Year R M K College Of Engineering and Technology Jeffrin M Kaneska S M Kaviya sri V Kaniga P R Kaviarasi D arasi21307 @gmail.com AI&DS Second Year ORION-PS-03: SYLVASENSE
ORION-S0128 Forged In Code 6 Hareeni Pavendan hareeni25110227@snuchennai.edu.in B.tech cse Iot Second Year Shiv nadar university chennai Deepika Shivani V M.JAYASHRI BA GURUPRIYA Arulmozhi S Ranjith S ranjith25110441@snuchennai.edu.in Btech AIDS Second Year ORION-PS-01: FLOATCHAT
ORION-S0129 Zoro 6 Gayathri.K sec25ec140@sairamtap.edu.in ECE/B.E Second Year Sri Sairam engineering college Keerthiga.O Kotteeswari.R Balaji Aravind .R Nitheshkumaran.S Lalitha.M.J sec25cs124@sairamtap.edu.in CSE/B.E Second Year ORION-PS-04: Open Innovation Track
ORION-S0130 Cyber Rookies 3 Yuvaraj K yuvaraj04a@gmail.com B.Tech CSE specialised in Internet of Things , Cybersecurity and Blockchain Technology Second Year Manakula Vinayagar Institute of Technology , KT kuppam, Pondicherry,Puducherry. Subabalan S Sanjay D ORION-PS-04: Open Innovation Track
ORION-S0131 Neuroforge 6 Hashvant S hashvant694@gmail.com Computer Science and Engineering Second Year DHANALAKSHMI COLLEGE OF ENGINEERING S Bhavana Shree Mahalakshmi V Mithra K Logitha L T MADHESH KUMAR madheshkumarpelleru@gmail.comComputer Science and Engineering Second Year ORION-PS-04: Open Innovation Track
ORION-S0132 Varns 6 A.Harshith harshith9436@gmail.com Cse Third Year SRM RAMAPURAM M Lokeswara Mukesh Chowdary Kamal Vamsi Thoufiq thoufiqshaik088@gmail.com CSE Third Year ORION-PS-03: SYLVASENSE
ORION-S0133 PHOENIX PROTOCOL 6 SRI LAKSHMI V J 25cs208@rmkcet.ac.in COMPUTER SCIENCE AND ENGINEERING Second Year RMK COLLEGE OF ENGINEERING AND TECHNOLOGYDEVIPRIYA R THANVITHA DOMMARAJU CHANDRASEKHAR VALERIN BRUCE SATHYA K SHARMISTHA K 25cs202@rmkcet.ac.in COMPUTER SCIENCE AND ENGINEERING Second Year ORION-PS-03: SYLVASENSE
ORION-S0134 STRAW HATS 2 Roshan Anto W roshan007cbi@gmail.com CSE SPECIALIZATION WITH AI &ROBOTICS First Year Sathyabama Institute of Science and Technology Prabakar M ORION-PS-04: Open Innovation Track
ORION-S0135 Tech Space 5 Saran S saran2101selvam@gmail.com CSE Third Year Dhanalakshmi Srinivasan Engineering college Shree Ram VARUN J VETRIVIGNESH Manoj ORION-PS-01: FLOATCHAT
ORION-S0136 Breaking Code 5 Isaac Jacksonraj J isaacjacksonraj16@gmail.com BE ECE Second Year Sathyabama Institute of Science and Technology Kavinaya Bhaskaran BJaya Joshna W Jayaraj Rijan S Indira M - - - - ORION-PS-03: SYLVASENSE
ORION-S0137 Claxon AI 3 SARRVESH J R kamaleshravikumar@gmail.com B.E CSE Second Year Sathyabama UNiversity Sharulatha s J Stevin jones ORION-PS-03: SYLVASENSE
ORION-S0138 Project Hail Mary 4 Dharani Karthikeyan dharanikk2007@gmail.com CSE core Second Year SRM Institute of Science and Technology, RamapuramLarshikha Krishnan V Divya Dharshini K S Hemapreiya Vijayakarthy ORION-PS-02: LEXVAULT
ORION-S0139 HexaCore 6 SACHIN G S sachinsarwesh58@gmail.com B.Tech CSE ( AIML ) Third Year SRM INSTITUTE OF SCIENCE AND TECHNOLOGY, RAMAPURAM Sanjeeve Rajan C R Vuppalapati Vedesh Hannish K Aishwarya S Roshini G Roshini252006@gmail.com B.Tech CSE(AIML) Third Year ORION-PS-01: FLOATCHAT
ORION-S0140 PROTOTHON 2 BALIREDDI V V N S ABHISHEK bmeabhishek@gmail.com btech Biomedical Engineering Third Year SRM UNIVERSITY RAMAPURAM VIMAL RAJ A ORION-PS-04: Open Innovation Track
ORION-S0141 RunTime Error 2 Charen s.charen1503@gmail.com B.E CSE Cyber Security Second Year Sathyabama institute of science and technology Sai Sri Vathsan ORION-PS-03: SYLVASENSE
ORION-S0142 Hi-Tech 5 Irina Charis B irina.charis@gmail.com B.E CSE Third Year Sathyabama Institute of Science and Technology Harish S Krithika A M Jaya Surya S G Hemanth Raju ORION-PS-01: FLOATCHAT
ORION-S0143 FineWorks 6 Praveen Balaji G sec25co025@sairamtap.edu.in Computer and Communication Engineering Second Year Sri Sairam Engineering College Saranesh S Nitish M Sakthi Saran G Seerthi Adhavan Tazim Sheriff R sec25co049@sairamtap.edu.in Communication and Communication Engineering Second Year ORION-PS-01: FLOATCHAT
ORION-S0144 Rebellions 6 Lokesh S [14] lokesh2007.07@gmail.com BE CSE AIML Third Year Jeppiaar Engineering College M Mohamed Rasool Raheesh Darsan G R Giridharan M Abdul Majeed A Dhinesh redvelan123@gmail.com BE CSE AIML Third Year ORION-PS-01: FLOATCHAT
ORION-S0145 SylvaAI 4 Pooja S poojasaravanan92@gmail.com Computer Science and Engineering Fourth Year Akshaya College of Engineering and Technology Vani S Meiram R Ramamoorthy K ORION-PS-03: SYLVASENSE
ORION-S0146 Tech Hackers 6 DIVYA T [15] divyatarasu.edu2007@gmail.com [16] B.Tech Artificial Intelligence and Data Science Second Year R.M.K College of Engineering and Technology Geethalakshmi B [17] Jahnavi R Giri P Deepak N S Hariharasuthan N hariharasudhanhari353@gmail.comB.Tech Artificial Intelligence and Data ScienceSecond Year ORION-PS-03: SYLVASENSE
ORION-S0147 Code Charms 6 Elakkiya.R 25cs050@rmkec.ac.in computer science and engineering Second Year R.M.K ENGINEERING COLLEGE Devadharshini.S ANANYA.R Keerthana.S GAAYATHRI DEVI R BILLU SHARIKA 25cs028@rmkec.ac.in CSE Second Year ORION-PS-04: Open Innovation Track
ORION-S0148 Voro 6 [18] Lalith Aditiya T A Lalithaditiya.Sist@gmail.com BE CSE Second Year Sathyabama institute of science and technology Kumaran R Likesh R Kishor J Krishna megha K S Kavi priya A lalithaditiya.sist@gmail.com BE CSE Second Year ORION-PS-04: Open Innovation Track
ORION-S0149 Mesh Minds 6 Tejasvini S tejasvinisuresh915@gmail.com ECE Fourth Year Vel tech rangarajan dr sagunthala R D institute of science and technology Syed Amrullah S A Chitra Devi R Praveen B Anoob S Jagadeesh R jagadeeshjagadeesh2620@gmail.com Mechanical Third Year ORION-PS-04: Open Innovation Track
ORION-S0150 NexQ 4 Ananya Sridhar Ananyasridhar.cse2024@citchennai.net CSE Third Year Chennai institute of technology Anantha Kumar B Avinash S Devikala M ORION-PS-04: Open Innovation Track
ORION-S0151 DoomCoders 5 [19] C Balaji Mohan cbalajimohan@gmail.com CSE Second Year SRM TRP ENGINEERING COLLEGE Abhikash S Adheep S Avinash V Siva Sitharthan N ORION-PS-03: SYLVASENSE
ORION-S0152 Tech Titans 6 R R Jaiwanth jaiwanthrrj25@gmail.com Btech csc First Year SRM institute of science and technology A Sai Hariharan N.Mughilan P.Jane Merlin A.Jayavarshini M.Rakshana rakshana1406@gmail.com Btech csc First Year ORION-PS-04: Open Innovation Track
ORION-S0153 TechCode 4 Devipriya B devinish07@gmail.com BE.Computer science and engineering Second Year Jaya engineering college Sakthi Devi L Naveen K Thulasi raman M ORION-PS-04: Open Innovation Track
ORION-S0154 MotwaGuard 6 Monica V venkateshmonica253@gmail.com AI&DS Third Year Jeppiaar Institue of Technology Karthikeyan B Velvizhi K Deepika M Ram Prasath G Dhinesh Kumar V dhineshv0707@gmail.com CSE Second Year ORION-PS-04: Open Innovation Track
ORION-S0155 StarByte 3 Jaidev S tarunjai415@gmail.com B.Tech Computer Science and Engineering Fourth Year Manakula Vinayagar Institute of Technology Karthikeyan S Senthamizharan V ORION-PS-03: SYLVASENSE
ORION-S0156 O[1] 6 M. Shirish gstharunadhithya08@gmail.com B.E csc Second Year Sathyabama Shirish M Shanjana s v Akilesh B Akshaya Beena Ben benjustin1806@gmail.com B.tech Second Year ORION-PS-04: Open Innovation Track
ORION-S0157 Astralis 4 yaathesh yaathesh12345@gmail.com ECE Second Year Rathinam Technical Campus Senthur pandian Aruthran Ponvel.G ORION-PS-02: LEXVAULT
ORION-S0158 Mindsprint 5 Frezha Angeline A frezhaangel09@gmail.com Information Technology Third Year Sri Sairam Institute of Technology, Chennai - 044. Dhanalakshmi K Nidhya Shree U Reya S Janani S ORION-PS-04: Open Innovation Track
ORION-S0159 Technocrats 5 Gunanithi M gunanithi2008@gmail.com Computer Science Engineering / B.E-C.S.E Second Year Sathyabama Institute of Science and technology Balarishikesh B S Hari Krishna V Bala Murali S Aswindh Kumar R ORION-PS-04: Open Innovation Track
ORION-S0160 ProofForge 3 Jerlin Goldia.J jerlingoldia2806@gmail.com BE.CSE Second Year Gojan School Of Business And Technology Nandhini R Jessica T ORION-PS-02: LEXVAULT
ORION-S0162 avengers codesday 6 M J Dhurgesh dhurgimadjack@gmail.com Cybersecurity Third Year SRMIST Harisudhan Sanjaidharshan s Tharun S Kabilan Shakeel irfan A r irfanshakeel1094@gmail.com Cybersecurity Third Year ORION-PS-04: Open Innovation Track
ORION-S0163 NOVERA 6 SUDHARSAN B sudharsanb2050@gmail.com B.Tech ECE Second Year SRM Institute of Science and Technology GANESH A S MOHAMED ROSHAN S SANJEEV J SAI NIKITHA SAI HARIKA NANU saiharika1227@gmail.com B.Tech ECE Second Year ORION-PS-03: SYLVASENSE
ORION-S0164 Clarabella 6 K SHALINI shalinikonduru21@gmail.com AIML Second Year panimalar engineering college SRINITHA G P ANBU SELVAN S Aravind .R Arjun.p Venureddy vaidvgr437@gmail.com AIML Second Year ORION-PS-04: Open Innovation Track
ORION-S0165 DR DOOM 4 KRITHIKAA B sec24cs096@sairamtap.edu.in CSE / BE Third Year Sri Sairam Engineering College ADITHYA S S JISHNUMUGUNTH MANIESWARI M V ORION-PS-01: FLOATCHAT
ORION-S0166 CODE CRACKERS 6 Monish R monish.rajesh07@gmail.com Computer Science and Engineering Second Year Sri Manakular Vinayakar engineering college Vasantharaj M Harishankar E Kaavinesh K Roshan B Mohan K ORION-PS-01: FLOATCHAT
ORION-S0167 GAITHUB 6 Santosh Raghavendra Y S daiwiksha@gmail.com Btech Computer science and medical engineering AIDA Second Year Sri Ramachandra Faculty of Engineering and Technology RAKSHAN RS Yuvan krishnan Mario Ralph Baxter Udhaya Mithran E0525006@sriher.edu.in Btech computer science and medical engineering AIDA Second Year ORION-PS-04: Open Innovation Track
ORION-S0168 NOVATRIX 6 PRAVEEN KUMAR M 2k24cse143@kiot.ac.in BE.CSE Third Year knowledge institute of technology RAGURAM.A SACHIN RAJA.R Rithish Barath N SACHIV.R SAKTHI.T C 2k24cse170@kiot.ac.in BE.CSE Third Year ORION-PS-04: Open Innovation Track
ORION-S0169 Hack Aspirants 4 keerthaesh kumar M 2025ad0007@svce.ac.in B tech artificial intelligence and data science Second Year sri venkateswara college of engineering kavya S karishma D bharath N ORION-PS-04: Open Innovation Track
ORION-S0170 Bhairav 6 Vinish Vinoth vinishvinoth1988@gmail.com Aiml Second Year Panimalar engineering college BARATH D SANTHOSH KUMAR V SAI SANTHOSH T Janani sri Pooja Laxmi poojalaxmi07@gmail.com Aiml Second Year ORION-PS-04: Open Innovation Track
ORION-S0171 Change Making engineers 5 Suthakar P sowntharyapattuvel@gmail.com Electrical and electronics engineering Third Year Acharya College of engineering technology Devadharshini R Deepa G Aravind I A.DHANUSRI ORION-PS-04: Open Innovation Track
ORION-S0172 FastLane Devs 6 K.Harshith harshith8297@gmail.com CSE AIML Third Year SRM Institute of Science and Technology M.Srikanth U.Veerendra J.Rasmitha sai [20] K.nikhil reddy S.Bharath bharathreddy4372@gmail.com CSE AIML Third Year ORION-PS-04: Open Innovation Track
ORION-S0173 Crypto knights 6 Udhaya Raghavi S raghavi20056@gmail.com BTech Information technology Second Year Easwari engineering college Shruthilaya RP Sindhya sridharan Varnikha sri Shreya S Shadhana bsshadhana@gmail.com BTech Information technology Second Year ORION-PS-03: SYLVASENSE
ORION-S0174 Techno sist 4 Aathimaduran. S aathiash2007@gmail.com B. E(CSE) Second Year Sathyabama institute of science and technology chennai Ahmed Azeer. A Charan. G Vijayan. S. K ORION-PS-01: FLOATCHAT
ORION-S0175 MADMAXX 6 Abinandhana A abinandhana1313@gmail.com Btech IT Third Year Sri Sairam Institute Of Technology ANIKASRI.B PRIYADHARSHINI S Aarthi S Sunethra J Jerusha W sit24it101@sairamtap.edu.in IT Third Year ORION-PS-04: Open Innovation Track
ORION-S0176 VIBRANT 6 HARIHARAN D dhariharan38@gmail.com CSE/B.Tech Third Year SRM Institute of science and technology Dhanush S Julian Steve Anban R Sanjay Aanish Nithin T R Ajay Dharrsan Ajaydharrsan@gmail.com CSE/B.Tech Third Year ORION-PS-04: Open Innovation Track
ORION-S0177 Team swam 6 Yamini. S yamini242008@gmail.com AIDS Second Year Jeppiaar institute of technology Priyadharshini. H Padma Priya. R Sabishree. R Dharun. M Philips Gabriel B Philipsgabi007@gmail.com AIDS Second Year ORION-PS-04: Open Innovation Track
ORION-S0178 Null exceptions 6 S MONIKA monikasan0703@gmail.com B.tech CSE aiml Third Year SRM INSTITUTE OF SCIENCE AND TECHNOLOGY TRICHY Sheik abdhulla Yuvanesh Rahul Harshini Aswathy Aswathy ramesh802@gmail.comB.TECH IT Second Year ORION-PS-01: FLOATCHAT
ORION-S0179 CODECREW 5 Nithiya Sri G 25ad105@rmkcet.ac.in Btech Artificial intelligence and datascience Second Year RMK College of Engineering and Technology Logeswari A Nivetha S Lekkala Pranathi Kanimozhi ORION-PS-04: Open Innovation Track
ORION-S0180 cyber crew 5 Lithesh B litheshb8@gmail.com BE CSE Second Year EASWARI ENGINEERING COLLEGE lohendra C Kirankumar P Karthick S Sri abinandhan S ORION-PS-04: Open Innovation Track
ORION-S0181 Techaura 4 Harini A hariniannamalai2006@gmail.com CSE Fourth Year University college of engineering kanchipuram Nandhini V Ramya D Amirthavarshini P ORION-PS-02: LEXVAULT
ORION-S0182 Phoenix coders 6 Sameer C sam2414e@gmail.com BTech CSE core First Year SRM Institute of Science & Technology, Tiruchirapalli Campus M.R.Magdalene Aakshy Sharon J R Chinthaamani R M SATHIYA NARAYANAN S B.jayanth swamy jayanthswamy143@gmail.com Btech CSE core First Year ORION-PS-04: Open Innovation Track
ORION-S0183 _ENDEAVOUR_ 6 RAGHUL T raghul.t.2025.cse@rajalakshmi.edu.in CSE Second Year Rajalakshmi engineering college AJAY P RAGHAV S RAGHUL K MOVIN T SHARVESH S sharvesh.s.2025.cse@rajalakshmi.edu.in CSE Second Year ORION-PS-03: SYLVASENSE
ORION-S0184 Compilers 6 Sasikumar S sasikumarldrago@gmail.com Computer science and Engineering Third Year Vel Tech High Tech Dr. Rangarajan Dr. Sakunthala Engineering College Gowtham Thirumuru Sachin Rao Sreeja R Rakesh D Ram P pram040706@gmail.com Computer Science And Engineering Third Year ORION-PS-04: Open Innovation Track
ORION-S0185 Codespark 4 Keerthana K Kannaniron1977@gmail.com CSE Second Year Dhaanish Chennai college of Engineering Muthu Prabha Dharshana S Gifta Alice ORION-PS-03: SYLVASENSE
ORION-S0186 Espiron 5 Vishhwa vasudevan vishhwa.vasu@gmail.com BE Computer science Engineering Second Year Sathyabama institute of science and technology Yogitha M Gautham K Jeyandhana Amirthini SYogeshwaran M ORION-PS-04: Open Innovation Track
ORION-S0187 Sleepless Knight 5 Lynton Oreb lynton.oreb@gmail.com Information technology Third Year Anand institute of higher technology Dharshini V Hemamalini V Mukilan S Prithiviraj S ORION-PS-02: LEXVAULT
ORION-S0188 NexGen 5 ERIN RAICHEAL JUVENAL erinraicheal@gmail.com B.E. Computer Science Engineering Second Year Sathyabama Institute of science and technology Antony Jernaus J Haashini M Vishal V M Yokeshkumar S ORION-PS-04: Open Innovation Track
ORION-S0189 B NIRANJAN 4 NIRANJAN niranjanbalu2007@gmail.com CSE Second Year Panimalar enginering college NITISH P Pranov P Nithivalavan D Navin SD navin.prem2006@gmail.com CSE Second Year ORION-PS-02: LEXVAULT
ORION-S0190 ARIV — AI & Research Innovators with Vision 6 SHAPTHAGIRI G shapthagiri2007@gmail.com B.TECH.IT Second Year SRM TRP ENGINEERING COLLEGE, TRICHY UMAIRA FATHIMA Z SHAHIRA M RENGESH M SAI SARAN N SAHANA E ssahana26072008@gmail.com B.TECH.IT Second Year ORION-PS-04: Open Innovation Track
ORION-S0191 Bytebros 5 Santhosh S sanshiv2709@gmail.com B.E-EEE Second Year Coimbatore Institute of Technology, Coimbatore Sharpika M Sravani L A Riya Denio J Ragavendhra G ORION-PS-04: Open Innovation Track
ORION-S0192 NextGen Innovators 6 Yazhini SP spyazhinikanmani@gmail.com CSE Third Year Prathyusha Engineering College Shakthi Priya B Dhanushree A Livasha M Kirubhanandham S G Santhosh Udaiyar tiisari502@gmail.com CSE Third Year ORION-PS-04: Open Innovation Track
ORION-S0193 TEAM VOID 5 Antony Xavier J M antonyxavierjm@gmail.com B. Tech CSE Third Year SRMIST, RAMAPURAM Rahul V Kavya P Harshini S Mathivadani A ORION-PS-02: LEXVAULT
ORION-S0194 alpha safety 6 Bhuvan K kbhuvan1807@gmail.com B.Sc AI & ML Second Year hindusthan college of arts and science, coimbatore selva kumaran P Bavya S Rubika P sathya priya P kishore B 25bai057@gmail.com B.Sc AI & ML Second Year ORION-PS-04: Open Innovation Track
ORION-S0195 Ctrl freaks 6 KAVIYA B kayab5608@gmail.com Electronics and communication engineering Second Year Rajalakshmi engineering college KANISHKA V S KARTHIKEYAN M KEERTHIKA J KARTHIGAENI SINGARAVELAN KEERTHANAA G keerthanaa.g.2025.ece@rajalakshmi.edu.in ELECTRONICS AND COMMUNICATION ENGINEERING Second Year ORION-PS-02: LEXVAULT
ORION-S0196 TerraVision AI 6 Sudharshan arsansudh06@gmail.com BE (Robotics and automation) Second Year Gojan school of business and technology Wilson Christhu doss M Rajesh Yogasree Santhosh Beulah beulah19072007@gmail.com B TECH ( AI&DS ) Second Year ORION-PS-03: SYLVASENSE
ORION-S0197 Top gun 6 deepak itzdeepak1110@gmail.com BE cse Ai and Robotics Second Year Sathyabama institute of science and technology GOWTAM ADITYA KAMLESH ADITHYA KRITHIK NITHIN S T SHREESHANTH PURJITH KRISHNA Purujithkrishna@gmail.com BE CSE AI AND ROBOTICS Second Year ORION-PS-04: Open Innovation Track
ORION-S0198 Cyber Kiddies 6 Jesin Milesh M jesinmilesh61@gmail.com B.E CSE(Cyber Security) Third Year Prathyusha Engineering College Libinesh R U Jeshwanth V Jeeva D Madeshwaran P Ashish N ashishmails06@gmail.com B.E CSE(Cyber Security) Fourth Year ORION-PS-02: LEXVAULT
ORION-S0199 PREETHI A 3 PREETHI A preethi.madura@gmail.com IT / B.Tech Second Year Sri sairam engineering college VINOTHINI T MOHANA P Y ORION-PS-03: SYLVASENSE
ORION-S0200 Binary Brains 4 Naveena R 2111naveena@gmail.com B.Tech.Information Technology Third Year K.S.Rangasamy College of Technology Pranav A Praveen L R Pooja R ORION-PS-04: Open Innovation Track
ORION-S0201 Hackhive 4 JEYASHREE V jayashaya250@gmail.com Computer Science and Engineering Second Year RMK COLLEGE OF ENGINEERING AND TECHNOLOGY HARSITHA C KAVIBHARATHI M JENITHAASRI M ORION-PS-04: Open Innovation Track
ORION-S0202 Yokeshwaran 4 Yokeshwaran yokeyokesh162@gmail.com B.tech-AI&DS Third Year Meenakshi sundhararajan engineering college Sudharshan R Sudesh pranav E.S Sateendar H ORION-PS-04: Open Innovation Track
ORION-S0203 elytra tech 3 samuel joel ponraj samueljoelponraj@gmail.com eee Fourth Year panimalar samuel varghese paul jeromae ORION-PS-03: SYLVASENSE
ORION-S0204 Dronai 3 Rannadeer kumar seetha rannadeer2006@gmail.com Btech/CSE-AIML Third Year Srm University kattangulattur Nanda Kishore Chavvakula Arshad s ORION-PS-04: Open Innovation Track
ORION-S0205 CrackAura 6 SRIRAM M sriramragnorok1305@gmail.com B. E. CSE(IoT) Third Year Sri Sairam Institute of Technology Vandhana Murugan Vimaladhithya C V Vedhika N Thuthiksha bhavana Janani S sit24ci049@sairamtap.edu.in BE CSE(Iot) Third Year ORION-PS-04: Open Innovation Track
ORION-S0206 The Creators 6 Sweety Vincent sweetyvincent26@gmail.com B.Tech Artificial Intelligence and Data Science Fourth Year Panimalar Engineering College Swapna R V Ruba Darshni J Srinitharaj Sruthi Krishnan Kavivarshni G kavivashini.g@gmail.com B tech Artificial Intelligence and Data Science Fourth Year ORION-PS-04: Open Innovation Track
ORION-S0207 Quantum Minds 4 manasvi sachin jagtap Manasvijagtap9936@gmail.com Information technology Second Year Trinity academy of engineering pune madhura sunil pawar shivani appa vyavahare Sandesh shivaji bongane ORION-PS-04: Open Innovation Track
ORION-S0208 git commit -m "Victory" 4 Daniel Sebastin A danielsebastinds@gmail.com Artificial Intelligence and Data Science Third Year Sri Manakula Vinayagar Engineering College Ramya Clemenceau Javid Ali A Gokhul A ORION-PS-04: Open Innovation Track
ORION-S0209 Binary Brains 5 GONEDA Tushar Karthik gonedatusharkarthik@gmail.com CSE(AI&DS) Second Year Siddhartha Academy of Higher Education Mallipeddi omsaiteja Challapareddy Ram Charan M S N V Chandra Mouli Akkineni Sai Venkat ORION-PS-04: Open Innovation Track
ORION-S0210 Hack Hype 6 Nandhini panneerselvamnandhini1@gmail.com Computer Science Engineering Second Year Sri Manakula Vinayagar Engineering College Harshini D Kirithika. A Roshith O Sastha S Nirmalkumar M nk885652bruh@gmail.com Second Year ORION-PS-01: FLOATCHAT
ORION-S0211 LinkupLaps 6 Prakash R prakash.r.2024.cse@rajalakshmi.edu.in BE-CSE Third Year Rajalakshmi Engineering College Prasanna K Pranav GS Piraisoodan R Nithyanandh BS Rajeshwar S rajeshwar.s.2024.cse@rajalakshmi.edu.in BE-CSE Third Year ORION-PS-03: SYLVASENSE
ORION-S0212 Debug Divas 6 Atchaya M S atchaya24112007@gmail.com B.Tech Artificial Intelligence and Data Science Second Year Chennai Institute of Technology priyadharshini J Aarthi V Harini J Renuka R suriyakala S suriyakalas.aids2025@citchennai.net B.Tech AI&DS Second Year ORION-PS-03: SYLVASENSE
ORION-S0213 AquaByte 3 MOHAMED RIYASKHAN S mriyaskhan254@gmail.com B.Tech - INFORMATION TECHNOLOGY Second Year Rathinam Technical Campus Santhosh S Ramkumar K Rohit R S ORION-PS-01: FLOATCHAT
ORION-S0214 Code Forge 5 Vaarshini B vaarshinib07@gmail.com IT Third Year Panimalar engineering college Palaneappan M Harini B Sumurthaa V Mutthu M ORION-PS-01: FLOATCHAT
ORION-S0215 ALGOS 5 Vishnu D vishnu.d2025aiml@sece.ac.in CSE(AIML) Second Year Sri Eshwar College Of Engineering Raja Thinakaran V Riya R Tharika Nayaki S Yuvaraj C ORION-PS-01: FLOATCHAT
ORION-S0216 C0DE RED 4 Sagaar suresh sagaarsuresh2@gmail.com B.Tech in Artificial Intelligence and Data Science Third Year Meenakshi Sundararajan Engineering College Ritthiga B Venkatesan R Rithika V ORION-PS-04: Open Innovation Track
ORION-S0217 TechAura 4 K.Shri vijaya harini harinikalimuthu14@gmail.com B.Tech IT Fourth Year Er.Perumal manimegalai college of engineering Roshini A Nasiba Nusurath fathima ORION-PS-01: FLOATCHAT
ORION-S0218 Sparks 6 Vilina K vilinakrishnasamy@gmail.com BE CSE Second Year Kgisl institute of technology Varuna V Varshini R Sriharini K Stephy Alice Christy D Sri Varshini V Srivarshini.v_25cs@kgkite.ac.in BE CSE Second Year ORION-PS-04: Open Innovation Track
ORION-S0219 INQORA 6 X.KRECENCIA xkrecencia07@gmail.com B.E /ECE Second Year vel tech multi tech dr rangarajan dr sakunthala engineering college HARISH BABU M SURYA G V THANUSHREE K S ANUGRAHA SAJI Shaai Ganesh P shaaiganesh23@gmail.com B.E / ECE Second Year ORION-PS-01: FLOATCHAT
ORION-S0220 The Quantum Coders 6 Sivanandham G gsivanandham56@gmail.com B.E Computer Science and Engineering Third Year R.M.K College of Engineering and Technology Srikanth Y Richardson S Ukesh Kumar R Giridharan V Ragav Rathinam V ragavrathinam2006@gmail.com B.E Computer Science and Enginering Third Year ORION-PS-02: LEXVAULT
ORION-S0221 Team titans 6 AKSHAYA K 111625201005 25ad005@rmkcet.ac.in Aids Second Year R.M.K College of Enginnering and Technology Dhiya R Dharshini PV Harshitha V Bhuvana Lakshmi B Heena S.V 25ad056@rmkcet.ac.in Aids Second Year ORION-PS-04: Open Innovation Track
ORION-S0222 NeuroFlux 4 Madhumitha T K 25243037@nec.edu.in Artificial Intelligence and Data Science Second Year National Engineering College Malathi S Nevetha D Mariammal M ORION-PS-03: SYLVASENSE
ORION-S0223 Deep Matrix 6 V Hari Krishnan harikrishnan.venkitakrishnan@gmail.com CSE Second Year Chennai Institute Of Technology A Lohit Ruhan Prasad S Aravintakshan A L Nithin K Sri Aarush Tej N sriaarushtejn.cse2025@citchennai.net CSE Second Year ORION-PS-04: Open Innovation Track
ORION-S0224 Shadow_Monarch 2 Pavan Kumar pavankumaroruganti77@gmail.com CSE Second Year INDIAN INSTITUTE OF INFORMATION TECHNOLOGY KOTTAYAM Karunya ORION-PS-03: SYLVASENSE
ORION-S0225 Yeah squad 6 Rubendran V arunachalatelecom@gmail.com CSE Third Year I.F.E.T college of engineering Sanjay K Ravisankar J Sundaresan K Sivaganesh S Sudharshan A sudharshansus04@gmail.com CSE Third Year ORION-PS-04: Open Innovation Track
ORION-S0226 Doddlebug 4 Avinash Venkatraman avinashvenkat2005@gmail.com Information Technology Fourth Year Chennai Institute of Technology LAKSHMIPRIYA S Dharshini M Aravind Kumar P ORION-PS-01: FLOATCHAT
ORION-S0227 Tech innovator 4 Pragadeshwaran pragadeshwaran231@@gmail.com Computer and science Third Year Prathyusha engineering college Priya. S Varshini. S Vishal ORION-PS-04: Open Innovation Track
ORION-S0228 Eagerists 6 Deepa Ganesh J ganeshdeepak897@gmail.com Computer science and engineering Third Year Kcg college of technology Elancholan P Aravindhane VS Jayakips Antony Jeevesh M Rajaneesh 9124104119 Computer science and engineering Third Year ORION-PS-01: FLOATCHAT
ORION-S0229 Coderzz 2 Sneha J 26snehaj@gmail.com Computer science and engineering Third Year Veltech Hightech Dr Rangarajan and Dr Sakunthala Engineering College Sasidharan K Madhumithaa Kathiravan Soundari ORION-PS-01: FLOATCHAT
ORION-S0230 PARAGON 3 Sai Sowndiriyaa T sai.sowndiriyaa10@gmail.com B.E. Computer Science and Engineering Second Year Rajalakshmi Engineering College Sai Sruthi S Sanjai B ORION-PS-02: LEXVAULT
ORION-S0231 Corex 6 Parthasarathi M mpar.cse2024@rmd.ac.in CSE Third Year R.M.D Engineering College Muniraja P.M MUGESHKUMAR M MUKUNDAN T Mohan Raj N PRASHANTH H hpra.cse2024@rmd.ac.in CSE Third Year ORION-PS-04: Open Innovation Track
ORION-S0232 Galactic Force 4 C.Tarunarayan 25su2360024@student.hindustanuniv.ac.in BCA General Second Year Hindustan Institute Of Technology And Science Guru Varshini Melvin Prince Rohan R Mithun Kumar ORION-PS-02: LEXVAULT
ORION-S0233 Code titans 2 Sabareesh sabareeshsivakumar88@gmail.com Computer science and engineering Third Year Veltech hightech Madhumithaa Kathiravan Soundari ORION-PS-04: Open Innovation Track
ORION-S0234 Alpha 3 Sharvesh S sharveshhhh23@gmail.com B.E CSE Second Year Sathyabama Institute Of Science And Technology Siddharth P Sarveshvijay K ORION-PS-01: FLOATCHAT
ORION-S0235 Bleach 5 Sriya Bheema sriyabheema10@gmail.com CSE Second Year Amrita Vishwa Vidyapeetham Mohan Nikitha N . Sabareesh raam Sabarish. S Sainath P ORION-PS-04: Open Innovation Track
ORION-S0236 Cupid.exe 2 Sachin R vh14307@velhightech.com Ece Third Year Veltech High tech dr Rangarajan dr sakunthala engineering college Sangeetha P ORION-PS-04: Open Innovation Track
ORION-S0237 Team Endeavours 3 Srirangapprasath I rangapprasathsri@gmail.com Artificial intelligence and data science Second Year Rathinam Technical Campus Sudharsan S Srirangapprasath I ORION-PS-04: Open Innovation Track
ORION-S0238 AQUABOTS 6 DHIVYASHRI S Sit24sc039@sairamtap.edu.in Cse with cyber security Third Year Sri Sairam institute of technology DEVASHRI S FARHANUDIN B SULAKA B NEERAJA S THOLKAPPIYAN Y sit24ec122@sairamtap.edu.in ECE Third Year ORION-PS-04: Open Innovation Track
ORION-S0239 Quinex 6 K.Sabana Banu sabananscet@gmail.com Information Technology Second Year Nadar Saraswathi college Of Engineering And Technology R.Pavithra M.Muthu Vetha Varshini R.Abirami S.Aishwarya Lakshmi S.Akshaya sakshaya872@gmail.com Information Technology Second Year ORION-PS-02: LEXVAULT
ORION-S0240 DSCE 4 Nadin S nadinsenthil@gmail.com BE.ECE Second Year Dhanalakshmi Srinivasan College of Engineering Mokeshwaran G Mathuravel G Manojkumar J ORION-PS-04: Open Innovation Track
ORION-S0241 Tech Tetra 4 Kavisri A srikaviarun611@gmail.com B tech ECE core First Year SRM Institute of Science and Technology Janani N Ashni JV Nivi R ORION-PS-04: Open Innovation Track
ORION-S0242 Epsilon 6 Sanchita S sanchita.sathish@gmail.com B.E CSE Third Year Sathyabama Institute of Science and Technology Thilak Raj V Sheniga Sam Robert Jasmine R Miraculin Rose Ahmad Faiyaz M D Nafiz Ahmed nafizahmed8340@gmail.com B.E CSE Third Year ORION-PS-01: FLOATCHAT
ORION-S0243 AI INFINITY 6 Jibriya Begam A jibriyamjith@gmail.com CSE Third Year IFET COLLEGE OF ENGINEERING Lakshayaa Nisha Logeshwar K Janarthanan D Nizamudeen S snizamudeen018@gmail.com CSE Third Year ORION-PS-03: SYLVASENSE
ORION-S0244 AXION 6 VASANTHAKUMAR S vasanthakumar.s301@gmail.com AIML Second Year Dhanalakshmi srinivasan college of engineering and technology AAKASH K NISMA FATHIMA N BHIBISHA JASMINE FKAVIYASHREE T VIJAY SHARMA J jvijaysharma2007@gmail.com AIDS Second Year ORION-PS-02: LEXVAULT
ORION-S0245 DayOne 6 R S M Sri Vishnu ramyan.srivishnu2007@gmail.com CSE Third Year Hindustan Institute of Technology and Science Varshen S C Vishnu M Anbu Selvan T Sanjith V Harsshan S 24cu0320048@student.hindustanuniv.ac.in CSE - AIDS Third Year ORION-PS-04: Open Innovation Track
ORION-S0246 Algorise 5 Krishna Karthi krishnakarthik210@gmail.com CSE Fourth Year Jerusalem College of Engineering Dhatshna S Kiruba Maha lakshmi Kiruthika ORION-PS-04: Open Innovation Track
ORION-S0247 Syntax Errorist 5 Keerthika J keerthika19.js@gmail.com CSE Third Year Meenakshi Sundararajan Engineering College Harshini Priya V Asvika N Dande Varshitha Janani J ORION-PS-02: LEXVAULT
ORION-S0248 CodeMax 3 Ili. Srinidhi ilisrinidhi32@gmail.com CSE(AI&ML) Second Year SRU Suram Varshini Gajula Vedhasree ORION-PS-03: SYLVASENSE
ORION-S0249 Technoverse 6 Lohith kumar R lohithkumar2107@gmail.com B.E-ECE(DS) Second Year Sathyabama university GokulJayandan R S Kiranraj M P S kishore Ganapathy B Ganapathy B ganapathy03102007@gmail.comIT B.TECH Second Year ORION-PS-01: FLOATCHAT
ORION-S0250 ADAM 6 Archana R 717825I204@kce.ac.in Artificial intelligence and intelligence Second Year Karpagam college engineering Dhanush Krishna sp mega varsan VE Nandhana H B Atchaya B Jonish Antony A 717825i125@kce.ac.in AI&DS Second Year ORION-PS-04: Open Innovation Track
ORION-S0251 Tech Morphers 6 Naveen Kumar R mrnaveenkumar911@gmail.com Electrical and electronics engineering / BE Third Year Saranathan college of engineering Sruthi V Thakshinya B Dharaniga K Moses Shaam M J Shrivatsan M Shrivatsanm@gmail.com Electrical and electronics engineering/ BE Third Year ORION-PS-04: Open Innovation Track
ORION-S0252 Ecospectra 4 Sri Balaji S shunmugaganesanshunmugam@gmail.com IT Second Year Thiagarajar College of Engineering Alfin Isaac Guru Priyan Shri Veeran NA NA NA NA NA ORION-PS-03: SYLVASENSE
ORION-S0253 Alpha coders 6 Mohammed abdul muqeet ahmed abdulahmed192007@gmail.com Cse aiml Second Year Hindustan Institute of Technology and Science Sanjay S SHEIK ABDULLAH.N Andrey fredrick rohit srirajan Joseph snowin S Josephsnowin28@gmail.com B.tech cse Aiml Second Year ORION-PS-02: LEXVAULT
ORION-S0255 WHITE DOTS 3 Harrish T harrisharasu750@gmail.com Information Technology Second Year Erode Sengunthar Engineering College K N ASWIN Barathraj P H ORION-PS-04: Open Innovation Track
ORION-S0256 Dual Core 2 Mohammed Ashiq techchie01@gmail.com DS&AI Third Year Dr.MGR Educational Research Institute Subashini ORION-PS-04: Open Innovation Track
ORION-S0257 Apex Heroes 6 Abinav Sreenivas M sec25ec026@sairamtap.edu.in ECE Second Year Sri Sairam Engineering College Ashwin Joe R Siranjeevikaruppaiyan P Divagar S Balaji V Vishnu P sec25co019@sairamtap.edu.in CCE Second Year ORION-PS-04: Open Innovation Track
ORION-S0258 Crack Dots 3 aswin kumaragurubaran divahar60@gmail.com Information Technology Second Year Sengunthar Erode Engineering College Elamaran A Jagadeeshwaran S ORION-PS-04: Open Innovation Track
ORION-S0259 Obscura 5 BHUVAN BHANDARI B bhuvanbhandari.b.2025.aiml@rajalakshmi.edu.inAIML Second Year Rajalakshmi Engineering College DHANUSHRI A ASHIF HUSSAIN M JEEVA KUMAAR S ANUSH R ORION-PS-04: Open Innovation Track
ORION-S0260 Infinix 6 S Neha 2025it0196@svce.ac.in B.Tech IT Second Year Sri Venkateswara College of Engineering Ritika S Sugantha G Syed Israr Ahmed G Kishore P C M Sharvesh sharveshcm29@gmail.com B.Tech IT Third Year ORION-PS-04: Open Innovation Track
ORION-S0261 Codex 6 Sahana M Sm3958@srmist.edu.in Cse core Second Year SRM INSTITUTE OF SCIENCE AND TECHNOLOGY Tarifa Fathima Swetha M Tanushree R Lakshmi K V Yadhana A ya1689@srmist.edu.in cse core Second Year ORION-PS-04: Open Innovation Track
ORION-S0262 Quantum Coders 6 Kishore B bkishore1602007@gmail.com BSC-IT Third Year Sathyabama Institute of Science and Technology Tarunika V Vasanth R Gokul Raj K Kameesvar N Saravanan S saravanan072007@gmail.com BSC-CS Third Year ORION-PS-01: FLOATCHAT
ORION-S0263 QuadraX 4 Aditya Krishnan A adityakrishnan.achiever@gmail.com CSE (AI&ML) Second Year SRM TRP ENGINEERING COLLEGE VENKATESH R.P JASIM FAREES J DHIVESH A ORION-PS-04: Open Innovation Track
ORION-S0264 ERROR404 4 Sanjay.C sanjay.c.2025.cse@rajalakshmi.edu.in CSE Second Year Rajalakshmi Engineering college Satyajith.M Sanjay Udayashankar Sarika.R ORION-PS-01: FLOATCHAT
ORION-S0265 THE DECODERS 4 SAI HARISH M saharish2007@gmail.com COMPUTER SCIENCE AND ENGINEERING Second Year RAJALAKSHMI ENGINEERING COLLEGE SAI NIRMAL N SHAILESH P S PRASANTTH SAI G ORION-PS-01: FLOATCHAT
ORION-S0266 WHITE DEVILS 4 S.KAILASHWAR kailashwar24@gmail.com CSE(CYBER SECURITY) Second Year RAJALAKSHMI ENGINEERING COLLEGE PRABIN PS DEEPIKA K DEWANSH SINGH ORION-PS-04: Open Innovation Track
ORION-S0267 CODEX 6 SAM GODWIN A samg16103@gmail.com SAM GODWIN A First Year Sri Sairam Engineering College Jeffrin Lino Shalome PARVESH R CHINTANASRI R GOKULPATHY L MATHIYAZHAGI S mathitkm2009@gmail.com CSE - Internet Of Things First Year ORION-PS-04: Open Innovation Track
ORION-S0268 Inglourious Hackers 3 CHUKISIVAM VS chukisivam1718@gmail.com B.tech Computer Science (CSE) with Artificial Intelligence and Machine Learning (AI and ML) First Year Vellore Institute of Technology Vellore Sivasanjay M Krithika S ORION-PS-02: LEXVAULT
ORION-S0269 RENTRO 6 P.S.Abinaya psabinaya007@gmail.com Cse(Core) Second Year Srm Institute of Science and Technology,RamapuramVARSHA P J MADHUMITHA S LAKSHITHA S R.HARINE B.Divya divyadeco@gmail.com Ece Second Year ORION-PS-04: Open Innovation Track
ORION-S0270 BRAINROT 6 Gokila kumara chandru S ggokul83617@gmail.com Electronic and communication engineering Third Year KIT-kalaignar Karunanidhi institute of technology Aswin Sharma .S Amruth S BEO SJ PRAKASH Sri Prithviraj RB Sharathi A kit28.24bec095@gmail.com Electronic and communication engineering Third Year ORION-PS-04: Open Innovation Track
ORION-S0271 Team apex 5 Mani Govindan S manigovin1107@gmail.com Be cse Second Year Dhanalakshmi Srinivasan college of engineering and technology Sirajan. A M. Sakthibalan RAJAGUGAN C Karthigeyan. R ORION-PS-04: Open Innovation Track
ORION-S0272 Syntax 3 Rakshitha Pearlin.F rakshithapearl@gmail.com BE CSE Third Year Sathyabama institute of science and technology Narendra Naidu Laranya ORION-PS-03: SYLVASENSE
ORION-S0273 Rocks 6 Athi Narayanan athinarayanans7a2019.2020@gmail.com Information technology Second Year Thiagarajar College of Engineering Vimal Varshit V Sanjay B Mukkeshnarayan JR MArulraj sekhar d Ameer K k.ameerkamaal@gmail.com Mechanical Second Year ORION-PS-04: Open Innovation Track
ORION-S0274 Undefined Behaviour 5 312425148034 MISHALI B S mishalibala07@gmail.com B.E CSE(AML) Second Year St Joseph's Institute Of Technology Sharvesh S Nilofar Banu S Arikarthikessan S Kishorr Manickam B ORION-PS-04: Open Innovation Track
ORION-S0275 BOULT 6 YUVARAJ S yuvarajsv15@gmail.com B.Tech(AIML) Third Year PANIMALAR ENGINEERING COLLEGE VIJAYABALAJI D GNANDEEP P THIRUKUMARAN V VISHAL R YUVARAJ S yuvarajsv15@gmail.com AIML Third Year ORION-PS-04: Open Innovation Track
ORION-S0276 NeuroNex 6 Teja Sri M 25ad161@rmkec.ac.in ADS/B-Tech Second Year R.M.K Engineering College Sakthivel A Saraboji S Sowmiya M Supriya D Sanjay S 25ad130@rmkec.ac.in ADS/B-Tech Second Year ORION-PS-04: Open Innovation Track
ORION-S0277 Mindforge 4 Riyasri.P riyasweety16024@gmail.com B.Tech/ Information Technology Fourth Year Er. Perumal Manimekalai College of Engineering,Hosur F.Thasmiya Pooja.B.R L.Srividhya ORION-PS-04: Open Innovation Track
ORION-S0278 CIPHER 5 YOGEESHWARAN C yogeeshwaran.c.2025.ece@rajalakshmi.edu.in B.E ECE Second Year RAJALAKSHMI ENGINEERING COLLEGE YESWANT SAKTHI SK YUVARAJ D VIJAY KANNAN S THEJESHVAR KUMURAN ORION-PS-01: FLOATCHAT
ORION-S0279 IGNITE 5 Janani jananijai628@gmail.com Information Technology Second Year Jeppiaar Institute Technology Keerthi Vasan . R Sumaiya.N Kavipriya.A Raga Shri .VS ORION-PS-04: Open Innovation Track
ORION-S0280 ZENTRIX 6 AFRINA B afrinabasheer1111@gmail.com B.Tech Computer Science and Business Systems Third Year DR.N.G.P INSTITUTE OF TECHNOLOGY ABETHA SENTHALIR S V PREETHI S SHRI VIDYA S PAVITHRA R DHASARATHI O P 24244017@drngpit.ac.in B.Tech Computer Science and Business Systems Third Year ORION-PS-03: SYLVASENSE
NEXOVA 6 Shyam Sundar S shyamsundar.s.2025.mech@rajalakshmi.edu.in Mechanical Engineering Second Year Rajalakshmi Engineering College Kalai Selvi sk Sridhar Bhat Sujith KR Shivaani NT Tharan S tharan.s.2025.mech@rajalakshmi.edu.in Mechanical Engineering Second Year ORION-PS-04: Open Innovation Track
Phantom 6 Abishek Sunil Saraswathy abishekss2007@gmail.com B-Tech (CSE DS&AI) Third Year Dr. MGR EDUCATION AND RESEARCH INSTITUTE Balamurugan v Easwara Ramana Lalith Adithya S Ajesh R K Chaturya ekshitha kalakondachathuryaekshitha@gmail.com DS&AI Third Year ORION-PS-04: Open Innovation Track
Spartanzz Apex 6 Suriya GR suriyaravi1926@gmail.com B.E.Electronics and Communication Engineering (ECE) Third Year ADHIPARASAKTHI COLLEGE OF ENGINEERING Srikanth M Sumanraj K Yokesh E Monishkumar P Bharathkumar V bb977077@gmail.com B.E.Electronics and Communication Engineering (ECE) Third Year ORION-PS-04: Open Innovation Track
`;

interface ParsedRow {
  id?: string;
  teamName: string;
  count: number;
  leaderName: string;
  leaderEmail: string;
  department: string;
  year: string;
  institution: string;
  members: string[];
  ps: string;
}

function parseRow(line: string, index: number): ParsedRow | null {
  const trimmed = line.trim();
  if (!trimmed) return null;

  // Determine PS
  let ps = '';
  if (trimmed.includes('ORION-PS-01: FLOATCHAT')) {
    ps = 'ORION-PS-01: FLOATCHAT';
  } else if (trimmed.includes('ORION-PS-02: LEXVAULT')) {
    ps = 'ORION-PS-02: LEXVAULT';
  } else if (trimmed.includes('ORION-PS-03: SYLVASENSE')) {
    ps = 'ORION-PS-03: SYLVASENSE';
  } else if (trimmed.includes('ORION-PS-04: Open Innovation Track')) {
    ps = 'ORION-PS-04: Open Innovation Track';
  } else if (trimmed.includes('Artificial Intelligence & Machine Learning')) {
    ps = 'ORION-PS-04: Open Innovation Track (Artificial Intelligence & Machine Learning)';
  } else if (trimmed.includes('Open Innovation')) {
    ps = 'ORION-PS-04: Open Innovation Track';
  } else if (trimmed.includes('FinTech')) {
    ps = 'ORION-PS-04: Open Innovation Track (FinTech)';
  } else if (trimmed.includes('Sustainability / ClimateTech')) {
    ps = 'ORION-PS-04: Open Innovation Track (Sustainability / ClimateTech)';
  } else if (trimmed.includes('Web / Mobile Development')) {
    ps = 'ORION-PS-04: Open Innovation Track (Web / Mobile Development)';
  } else {
    ps = 'ORION-PS-04: Open Innovation Track';
  }

  // Check ID
  const idMatch = trimmed.match(/^(ORION-S\d{4})\s+(.+)/);
  let id: string | undefined;
  let rest = trimmed;
  if (idMatch) {
    id = idMatch[1];
    rest = idMatch[2];
  }

  // Match: TeamName Count LeaderName ...
  const countMatch = rest.match(/^(.+?)\s+(\d+)\s+(.+)/);
  if (!countMatch) return null;

  const teamName = countMatch[1].trim();
  const count = parseInt(countMatch[2], 10);
  const afterCount = countMatch[3].trim();

  return {
    id,
    teamName,
    count,
    leaderName: '',
    leaderEmail: '',
    department: '',
    year: '',
    institution: '',
    members: [],
    ps
  };
}

// 7 New Teams details exactly from Page 3 OCR
const NEW_TEAMS_DATA = [
  {
    id: 'ORION-S0277',
    teamName: 'Mindforge',
    count: 4,
    leaderName: 'Riyasri.P',
    leaderEmail: 'riyasweety16024@gmail.com',
    department: 'B.Tech/ Information Technology',
    year: 'Fourth Year',
    institution: 'Er. Perumal Manimekalai College of Engineering,Hosur',
    members: ['F.Thasmiya', 'Pooja.B.R', 'L.Srividhya'],
    ps: 'ORION-PS-04: Open Innovation Track'
  },
  {
    id: 'ORION-S0278',
    teamName: 'CIPHER',
    count: 5,
    leaderName: 'YOGEESHWARAN C',
    leaderEmail: 'yogeeshwaran.c.2025.ece@rajalakshmi.edu.in',
    department: 'B.E ECE',
    year: 'Second Year',
    institution: 'RAJALAKSHMI ENGINEERING COLLEGE',
    members: ['YESWANT SAKTHI SK', 'YUVARAJ D', 'VIJAY KANNAN S', 'THEJESHVAR KUMURAN'],
    ps: 'ORION-PS-01: FLOATCHAT'
  },
  {
    id: 'ORION-S0279',
    teamName: 'IGNITE',
    count: 5,
    leaderName: 'Janani',
    leaderEmail: 'jananijai628@gmail.com',
    department: 'Information Technology',
    year: 'Second Year',
    institution: 'Jeppiaar Institute Technology',
    members: ['Keerthi Vasan . R', 'Sumaiya.N', 'Kavipriya.A', 'Raga Shri .VS'],
    ps: 'ORION-PS-04: Open Innovation Track'
  },
  {
    id: 'ORION-S0280',
    teamName: 'ZENTRIX',
    count: 6,
    leaderName: 'AFRINA B',
    leaderEmail: 'afrinabasheer1111@gmail.com',
    department: 'B.Tech Computer Science and Business Systems',
    year: 'Third Year',
    institution: 'DR.N.G.P INSTITUTE OF TECHNOLOGY',
    members: ['ABETHA SENTHALIR S V', 'PREETHI S', 'SHRI VIDYA S', 'PAVITHRA R', 'DHASARATHI O P'],
    ps: 'ORION-PS-03: SYLVASENSE'
  },
  {
    id: 'ORION-S0281',
    teamName: 'NEXOVA',
    count: 6,
    leaderName: 'Shyam Sundar S',
    leaderEmail: 'shyamsundar.s.2025.mech@rajalakshmi.edu.in',
    department: 'Mechanical Engineering',
    year: 'Second Year',
    institution: 'Rajalakshmi Engineering College',
    members: ['Kalai Selvi sk', 'Sridhar Bhat', 'Sujith KR', 'Shivaani NT', 'Tharan S'],
    ps: 'ORION-PS-04: Open Innovation Track'
  },
  {
    id: 'ORION-S0282',
    teamName: 'Phantom',
    count: 6,
    leaderName: 'Abishek Sunil Saraswathy',
    leaderEmail: 'abishekss2007@gmail.com',
    department: 'B-Tech (CSE DS&AI)',
    year: 'Third Year',
    institution: 'Dr. MGR EDUCATION AND RESEARCH INSTITUTE',
    members: ['Balamurugan v', 'Easwara Ramana', 'Lalith Adithya S', 'Ajesh R K', 'Chaturya ekshitha'],
    ps: 'ORION-PS-04: Open Innovation Track'
  },
  {
    id: 'ORION-S0283',
    teamName: 'Spartanzz Apex',
    count: 6,
    leaderName: 'Suriya GR',
    leaderEmail: 'suriyaravi1926@gmail.com',
    department: 'B.E.Electronics and Communication Engineering (ECE)',
    year: 'Third Year',
    institution: 'ADHIPARASAKTHI COLLEGE OF ENGINEERING',
    members: ['Srikanth M', 'Sumanraj K', 'Yokesh E', 'Monishkumar P', 'Bharathkumar V'],
    ps: 'ORION-PS-04: Open Innovation Track'
  }
];

function norm(str?: string): string {
  return (str || '').toLowerCase().replace(/[^a-z0-9]/g, '');
}

async function run() {
  const storePath = path.resolve('.data/orion_store.json');
  const store = JSON.parse(fs.readFileSync(storePath, 'utf8'));

  const parsedList = rawLines.split('\n').map((l, idx) => parseRow(l, idx)).filter(Boolean) as ParsedRow[];
  console.log(`Parsed ${parsedList.length} rows from PDF OCR.`);

  // 1. Update existing teams in store with PS
  let updatedExisting = 0;
  for (const p of parsedList) {
    let team = store.teams.find((t: any) => t.registration_id === p.id);
    if (!team) {
      team = store.teams.find((t: any) => norm(t.team_name) === norm(p.teamName));
    }
    if (team) {
      team.problem_statement = p.ps;
      updatedExisting++;
    }
  }
  console.log(`Updated problem_statement for ${updatedExisting} existing teams in store.`);

  // 2. Add the 7 new teams if not present
  let addedNew = 0;
  const now = new Date().toISOString();
  for (const n of NEW_TEAMS_DATA) {
    let existing = store.teams.find((t: any) => t.registration_id === n.id || norm(t.team_name) === norm(n.teamName));
    if (!existing) {
      const teamUuid = crypto.randomUUID();
      const username = n.teamName.toLowerCase().replace(/[^a-z0-9]/g, '');
      const passRaw = n.leaderName.toUpperCase().replace(/[^A-Z0-9]/g, '') || 'ORION2026';
      const accessToken = passRaw.length >= 8 ? passRaw : (passRaw + '2026').slice(0, 12);

      const teamMembers: TeamMember[] = n.members.map((mName, mIdx) => ({
        id: crypto.randomUUID(),
        team_id: teamUuid,
        member_number: mIdx + 1,
        member_name: mName,
        member_phone: '',
        member_email: '',
        department: n.department,
        year: n.year
      }));

      const paymentRecord: PaymentRecord = {
        id: crypto.randomUUID(),
        team_id: teamUuid,
        utr_number: `VERIFIED-${n.id}`,
        payer_name: n.leaderName,
        payer_upi: 'official@upi',
        amount: 100,
        payment_status: 'VERIFIED',
        notes: 'Official verified roster PDF import',
        submitted_at: now,
        verified_at: now,
        verified_by: 'system_pdf_importer'
      };

      const newTeam: TeamRecord = {
        id: teamUuid,
        registration_id: n.id,
        team_name: n.teamName,
        username,
        leader_name: n.leaderName,
        leader_phone: '',
        leader_email: n.leaderEmail,
        institution: n.institution,
        department: n.department,
        year: n.year,
        problem_statement: n.ps,
        access_token: accessToken,
        payment_status: 'VERIFIED',
        payment: paymentRecord,
        amount: 100,
        registration_status: 'REGISTERED',
        round_1_status: 'SUBMISSION_OPEN',
        round_2_status: 'LOCKED',
        admin_notes: 'Official verified roster (2026-09-08)',
        members: teamMembers,
        submissions: [],
        resubmission_requests: [],
        audit_logs: [],
        created_at: now,
        updated_at: now
      };

      store.teams.push(newTeam);
      store.payments.push(paymentRecord);
      addedNew++;
    } else {
      existing.problem_statement = n.ps;
    }
  }

  console.log(`Added ${addedNew} new teams to store. Total teams now: ${store.teams.length}`);

  // Save store JSON
  fs.writeFileSync(storePath, JSON.stringify(store, null, 2), 'utf8');
  console.log(`Saved updated store to ${storePath}`);

  // 3. Generate SQL migration 020_update_team_problem_statements.sql
  const sqlLines: string[] = [
    '-- ==============================================================================',
    '-- 020 — Update Team Problem Statements from Official PDF Roster',
    '-- ==============================================================================',
    '-- ',
    '-- Updates problem_statement for all 260 existing teams based on official choices.',
    '-- Inserts the 7 new verified teams (S0277–S0283) with payment_status = VERIFIED.',
    '-- Apply this script in Supabase SQL Editor.',
    '',
    'begin;',
    ''
  ];

  // Updates for existing teams
  for (const t of store.teams) {
    const escapedPS = t.problem_statement.replace(/'/g, "''");
    sqlLines.push(`update public.teams set problem_statement = '${escapedPS}' where registration_id = '${t.registration_id}';`);
  }

  sqlLines.push('');
  sqlLines.push('-- Ensure the 7 latest squads exist with verified status');
  for (const n of NEW_TEAMS_DATA) {
    const team = store.teams.find((t: any) => t.registration_id === n.id);
    if (team) {
      const esc = (s?: string) => (s || '').replace(/'/g, "''");
      sqlLines.push(`
insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '${team.id}', '${team.registration_id}', '${esc(team.team_name)}', '${esc(team.username)}', '${esc(team.leader_name)}', '${esc(team.leader_phone)}', '${esc(team.leader_email)}',
  '${esc(team.institution)}', '${esc(team.department)}', '${esc(team.year)}', '${esc(team.problem_statement)}', '${esc(team.access_token)}',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '${team.created_at}', '${team.updated_at}'
) on conflict (registration_id) do update set
  problem_statement = '${esc(team.problem_statement)}',
  payment_status = 'VERIFIED',
  round_1_status = 'SUBMISSION_OPEN';
`);
    }
  }

  sqlLines.push('commit;');
  sqlLines.push('');

  const sqlPath = path.resolve('src/db/migrations/020_update_team_problem_statements.sql');
  fs.writeFileSync(sqlPath, sqlLines.join('\n'), 'utf8');
  console.log(`Generated migration script at ${sqlPath}`);
}

run().catch(console.error);
