import fs from 'fs';
import path from 'path';
import crypto from 'crypto';
import type { TeamRecord, TeamMember, PaymentRecord } from '../src/types/orion';

// ==============================================================================
// 260 Squads Extracted Verbatim from Official Updated PDF Roster
// ==============================================================================

interface RawSquad {
  id: string;
  name: string;
  count: number;
  leader: string;
  members: string[];
}

export const RAW_ROSTER: RawSquad[] = [
  // Page 1
  { id: 'ORION-S0001', name: 'Innovex', count: 3, leader: 'Yasaswini Chilukuri', members: ['Hiranya Pallerla', 'Loshitha B'] },
  { id: 'ORION-S0002', name: 'GirlsGotByte', count: 4, leader: 'S Darshini Jeya Shakthi', members: ['Athmaja A', 'URVI DEORE', 'PATEL DHARNI ARVINDBHAI'] },
  { id: 'ORION-S0003', name: 'Safegrid', count: 6, leader: 'Moses Sparjen K', members: ['Nandhini G', 'Tamil selvi SV', 'Sharveshwaran MS', 'Rakshitha S', 'Nithish abinav GK'] },
  { id: 'ORION-S0004', name: 'TechXKuzhu', count: 6, leader: 'Thanishka Yogesh', members: ['Lokeshwari R', 'Surya S', 'Nithish Kumar S', 'Mithun V', 'Madhu Karthikeyan S'] },
  { id: 'ORION-S0006', name: 'Neuro Forge', count: 6, leader: 'Sarveshwar V A', members: ['Sathish D', 'Sridharan R', 'Yaswanth S', 'Shrika M', 'Sanlin Benzer E'] },
  { id: 'ORION-S0007', name: 'HEXAFLUX', count: 6, leader: 'Sakthi lakshmi G', members: ['Sarifa Afrin M', 'Sahaya Ancy J', 'Roshini Infenta S', 'Sanjiv Andrew', 'Sanjai G'] },
  { id: 'ORION-S0008', name: 'Deadline Dodgers', count: 5, leader: 'E Gogulnath', members: ['Dharshan Y', 'Divyanth J', 'Anish Joshua', 'V Vishal'] },
  { id: 'ORION-S0009', name: 'CodeNova', count: 6, leader: 'Aditya P S', members: ['Neha M', 'Asmitha P', 'Danisha K', 'Devadharshini S', 'Buvana V'] },
  { id: 'ORION-S0010', name: 'LOGIC LORDS', count: 5, leader: 'JERIN N', members: ['INIYAVAN S', 'JAIDEV SP', 'JAI AADHITH', 'KALAISELVA'] },
  { id: 'ORION-S0012', name: 'Nexyra', count: 4, leader: 'B.ARVIND', members: ['K.BHARATHAN', 'B.AKASH', 'M.MARI SELVAM'] },
  { id: 'ORION-S0013', name: 'ARC', count: 5, leader: 'Yuvaraj K L', members: ['dharshan T R', 'charish P S', 'haris ahmed R', 'staffen G'] },
  { id: 'ORION-S0014', name: 'Tech Larper', count: 3, leader: 'Farnas.B', members: ['Jesran', 'Mohamed Noorul Haq M'] },
  { id: 'ORION-S0015', name: 'Adengappa naalu peru', count: 4, leader: 'N.Sham Venkat', members: ['A.Vinish', 'S.Robin kishor', 'M.Vinayagam'] },
  { id: 'ORION-S0017', name: 'SOLEX', count: 5, leader: 'Suryaprakash S', members: ['Yuvega N', 'Naveena A', 'Tamilarasan S', 'Hariharan I'] },
  { id: 'ORION-S0018', name: 'Travixa', count: 4, leader: 'Lovinsha', members: ['Suriya kiran', 'Hari balan', 'Ragul'] },
  { id: 'ORION-S0019', name: 'Team Verse', count: 5, leader: 'Naveenkumar P', members: ['Yazhini G A', 'Deepika D', 'Nivetha E', 'Akshaya R'] },
  { id: 'ORION-S0020', name: 'Tech titans', count: 6, leader: 'Deekshith. P', members: ['Kamalesh P', 'KAMALADHASAN. M', 'Prakashraj.V', 'Keerthivarman.G', 'Ramanan.R'] },
  { id: 'ORION-S0021', name: 'QRYVEXA', count: 3, leader: 'SENTHAMIZH SELVAN.V', members: ['RAHUL.M', 'YUGA BHARATHI.P'] },
  { id: 'ORION-S0022', name: 'Hackademics', count: 6, leader: 'Akshay Kumar N', members: ['Devaraj M', 'Pranav Narayan MS', 'Aadith Geeth Mohan', 'Srinivasan S', 'E Harikrishna'] },
  { id: 'ORION-S0024', name: 'ByteForge', count: 2, leader: 'Chandini Sundaran', members: ['Kanishka K'] },
  { id: 'ORION-S0025', name: 'REPLICANTS', count: 5, leader: 'Shirish Babu N', members: ['Tanishq Kumar', 'Aashin Nibhu', 'Gladiwin A', 'Manish K'] },
  { id: 'ORION-S0027', name: 'CYPHERFORGE', count: 6, leader: 'Arunadevi.S', members: ['Divyadharshini', 'Bhoomika.P', 'Anisha Lakshmi.G.S', 'Monisha.S', 'Pradhiksha.D'] },
  { id: 'ORION-S0028', name: 'Hacker Men', count: 6, leader: 'BHARANIDHARAN S', members: ['HARIKUMAR E', 'KAMALESH K', 'ASHWIN PERUMAL S', 'YUVAN SHANKAR B', 'ARVIND A'] },
  { id: 'ORION-S0029', name: 'adhiradi boys', count: 4, leader: 'Pushparaj J', members: ['Kamal T', 'Monish M', 'Nimmanagoti Tharun'] },
  { id: 'ORION-S0030', name: 'Error 404', count: 4, leader: 'S.Sai Dolasa', members: ['Chokkani.Vineela', 'R.Nandu Reddy', 'A.Joshika Reddy'] },
  { id: 'ORION-S0031', name: 'Hack hawks', count: 5, leader: 'GOPIKRISHNA S', members: ['KISHOR KUMAR s', 'Salman S', 'YOGESHWAR K', 'VISHNU B'] },
  { id: 'ORION-S0033', name: 'Code Blooded', count: 2, leader: 'Jahnavi Mogarala', members: ['Prathiksa G'] },
  { id: 'ORION-S0034', name: 'Little ghosts', count: 4, leader: 'Gokul chowdry S', members: ['Vishal', 'Anugraha PJ', 'Sanjana Rajasekar'] },
  { id: 'ORION-S0035', name: 'Apprentice', count: 6, leader: 'Navya M', members: ['Deepadarsni S', 'Hareesh Govind', 'Hariharan D', 'Guru Prasath', 'Balaji M'] },
  { id: 'ORION-S0036', name: 'MindMesh', count: 5, leader: 'Mrityunjay Krithick M', members: ['Oviya S', 'Paari S', 'Sasmita S', 'Thanmaysree K'] },
  { id: 'ORION-S0037', name: 'Bug syndicate', count: 5, leader: 'Megesh L', members: ['Rajiv G', 'Soma Sundari N', 'Dhanalakshmi', 'Bhavatarikha Lakshmana'] },
  { id: 'ORION-S0038', name: '405 decoders', count: 5, leader: 'Potnuru Prasanth kumar', members: ['Korada venkat sai', 'Dhanush kayala', 'Sai Gangadhar Adapa', 'Rajendra V'] },
  { id: 'ORION-S0039', name: 'Byteforge', count: 4, leader: 'Keshika Valli S', members: ['Kritya K', 'Keerthana E', 'Joshitha S'] },
  { id: 'ORION-S0040', name: 'Algoryx', count: 5, leader: 'Amirtha varsini R', members: ['Ramkarthikeyan G', 'Tharshan M', 'Kowsik Raja S', 'Sastiga Sri H'] },
  { id: 'ORION-S0042', name: 'THAMIZH ARIGNARGAL', count: 4, leader: 'Muhammadu Rasheeq J M', members: ['Sai saran A', 'V Mamata', 'Niranjana D'] },
  { id: 'ORION-S0044', name: 'Deadline Warriors', count: 6, leader: 'A.R Akshaya Kruthik', members: ['Dheeraj Abhay. R', 'Avinash. R', 'Dhanuja. J', 'S. SAKTHI SRI', 'Ashvin Prasad. k'] },
  { id: 'ORION-S0045', name: 'PROTECTECH', count: 4, leader: 'Deveshwar S', members: ['Sri Hari S', 'Vijay Karthick S', 'Sree Vishal K S'] },
  { id: 'ORION-S0047', name: 'Alpha Minds', count: 6, leader: 'Vasundra S', members: ['Vidhyaa Vardhani Ra', 'Narmatha R', 'Parvada Vardhni S', 'Niranjana S', 'Aishwarya'] },
  { id: 'ORION-S0048', name: 'BytePulse', count: 6, leader: 'Sadhana V', members: ['Rithika R', 'Ragavi S', 'pranika Shree C', 'Poornaa V', 'Prasanambika'] },
  { id: 'ORION-S0050', name: 'Byte me', count: 6, leader: 'Shivani', members: ['Jane Marria Harriet', 'Niveditha S', 'Aimy Grace P Georg', 'Jeshvina Emerald', 'Jhanavarshan AM'] },
  { id: 'ORION-S0051', name: 'Point Break', count: 6, leader: 'Chandru M', members: ['Jaya Karthick R', 'Harish S', 'Darshan K', 'Jovitha E', 'Harini BB'] },
  { id: 'ORION-S0053', name: 'Team Rogers', count: 6, leader: 'Vijayalakshmi.V', members: ['HendryPualDhinaka', 'Faazilah A.L.', 'Thirumalini.S', 'Hemachandran S', 'Nitesh kumaar V'] },
  { id: 'ORION-S0055', name: 'Cyber Warrier', count: 6, leader: 'Jaya Suriya k', members: ['Soorya', 'Subash', 'KATHIJA.M', 'R.Renuga Devi', 'RIGASHINI.s'] },
  { id: 'ORION-S0056', name: 'Interstellar', count: 6, leader: 'Farhan Ur Rahman M', members: ['Aiman Zulaiha M M', 'Adithyan Benoy V', 'Rathna Priya S', 'Srikar B V', 'Sushmitha E'] },
  { id: 'ORION-S0058', name: 'Codeflux', count: 6, leader: 'Praveena S', members: ['T Vignesh', 'Tamizharasi K', 'Yuvathi P', 'Sathiya nishka', 'Srinivasan V'] },
  { id: 'ORION-S0059', name: 'Elite', count: 2, leader: 'Madhumitha Manivannan', members: ['Devatharshini J'] },
  { id: 'ORION-S0060', name: 'Scarlet force', count: 5, leader: 'Madhumitha S', members: ['Janani R', 'Archaya U', 'Harini S', 'Brindhasri S'] },
  { id: 'ORION-S0061', name: 'Aquasense', count: 4, leader: 'Ratheesh M', members: ['Ravindran G', 'RishiKumar', 'Raajavarshan S.M'] },
  { id: 'ORION-S0062', name: 'OPTIPARK SYSTEMS', count: 3, leader: 'GOMATAM TRISHNA HAASINI', members: ['TULIKA JAISWAL', 'MOKSHITHA KAKARLA'] },
  { id: 'ORION-S0063', name: 'TECH TITANS', count: 6, leader: 'Ram Prakash S', members: ['Indhar A', 'SANJAY S', 'SHRI SANTH SUBAS', 'Rajathiruvarasu v', 'Sriharan A'] },

  // Page 2
  { id: 'ORION-S0064', name: 'STACKS', count: 5, leader: 'Praveen R', members: ['Rithikka P', 'Ramya R', 'Ranjeet P.I', 'Akash S'] },
  { id: 'ORION-S0065', name: 'LeafLogic', count: 6, leader: 'Swathika S', members: ['P Dhivyasri', 'Irfanaa Parveen M', 'Yoga Varshini M', 'Nandanaa devi A N', 'Keerthana M'] },
  { id: 'ORION-S0066', name: 'DeeBug', count: 5, leader: 'Ronak. N', members: ['Faheem Udheen', 'Lokesh Kumar', 'Aravindakshan', 'Thamilelelan'] },
  { id: 'ORION-S0067', name: 'NEXERA', count: 4, leader: 'Akshay Kumar P.V.', members: ['Trinab Shan', 'Harish K.', 'Seyon Ann Shibu'] },
  { id: 'ORION-S0068', name: 'Tech Titan', count: 6, leader: 'M.HARSHINI', members: ['Harini P', 'Iniya Alies Rasma M', 'Jeyashree S', 'Kanika A I', 'Jai Shree M'] },
  { id: 'ORION-S0069', name: 'TECHNO BRATS', count: 6, leader: 'Sruthi R', members: ['Thridev V M', 'Srinidhi kruthiha G', 'Vishnu Vedant Deva', 'Sriram V', 'Sudarshan A J'] },
  { id: 'ORION-S0070', name: 'Team_Name_26', count: 4, leader: 'Sai Krishna K J', members: ['Shreya Sivakumar', 'Ananthika S', 'Nilavadhani GS'] },
  { id: 'ORION-S0071', name: 'Bama Boyz', count: 6, leader: 'Arjun', members: ['Afnan Hussain k', 'Pranay', 'Sarvesh', 'Hasim', 'Guru prasath'] },
  { id: 'ORION-S0072', name: 'Femmora', count: 6, leader: 'Vaibhavashakthi R', members: ['Varshitha R', 'Sherlin Neha A J', 'Suryapriya A G', 'Harini S', 'Sornambiga S'] },
  { id: 'ORION-S0073', name: 'LOGIC LEGIONS', count: 6, leader: 'SIVAM P', members: ['MOHITHRA', 'Srivachan c s', 'Siva Ranjan S', 'Anika', 'Ambika'] },
  { id: 'ORION-S0074', name: 'VisionX', count: 6, leader: 'Yazhini B', members: ['Dharshini P', 'Bhavana Y', 'Kanuri Manobhi Abh', 'Poojitha G', 'Nandhini Y'] },
  { id: 'ORION-S0075', name: 'The imposter', count: 5, leader: 'Likith Krishna J', members: ['B Lakshman', 'Rishi S', 'Charan Josh A', 'Jagadhiswaran K'] },
  { id: 'ORION-S0076', name: 'Kalephor', count: 6, leader: 'Shivani SK', members: ['Rakhesh Anand RA', 'paul bryton raj', 'Pon Vijayalakshmi', 'Ramya KN', 'Padmavathy'] },
  { id: 'ORION-S0077', name: 'AgriVanguard', count: 5, leader: 'Thodupunuri Sai Charan', members: ['Akkala Rahul Reddy', 'Nalla Shreekar', 'Maramreddy Aakash', 'Podugu Harish'] },
  { id: 'ORION-S0078', name: 'Team Synergy', count: 6, leader: 'Nirmala Devi NS', members: ['E Divya', 'Mithra A', 'Sanjay', 'Jeswin Samuel P', 'Nirmal Kumar N S'] },
  { id: 'ORION-S0079', name: 'Biobytes', count: 6, leader: 'S A Srikanth', members: ['Sherina K S', 'Haniya.T', 'Rakshana A', 'Velu.E', 'Taranesh S'] },
  { id: 'ORION-S0080', name: 'JACK HACKROV', count: 5, leader: 'VISHWA I', members: ['SURYA BC', 'KILLIVALAVAN V', 'MOHAMMED ASIK T', 'SAKTHIVEL S'] },
  { id: 'ORION-S0081', name: 'IMPACT CODERS', count: 6, leader: 'Mohamed Aaseef M', members: ['Manoj R', 'Saravanakumar G', 'Sabarish J', 'Shafeeq S', 'Rohith V K'] },
  { id: 'ORION-S0082', name: 'Brain Byte', count: 4, leader: 'Aditi Phulre', members: ['Aditya Swaroop', 'Kavya Singh', 'Bhavay Mittal'] },
  { id: 'ORION-S0083', name: '404 Brain Not Found', count: 4, leader: 'HARISH R', members: ['DINESH RAJ B', 'RITHIN RS', 'AJAY PRABU RK'] },
  { id: 'ORION-S0084', name: 'TOOTHPASTE EATERS', count: 3, leader: 'RAJDEEP MAHADEV KULKARNI', members: ['Ayush Bidwai', 'Madhur Grover'] },
  { id: 'ORION-S0085', name: "Mission:I'm-Possible Oxygen", count: 5, leader: 'Jai ganapathi.S.B', members: ['Harish.T', 'Bolleboina Yashashwini Yada', 'Anya Angel', 'Abinaya S'] },
  { id: 'ORION-S0086', name: 'SHERLOCK', count: 5, leader: 'Sai Aditiyaa R S', members: ['Saravana Prasath P', 'Elakkiya K', 'Vrithika Sri', 'Sarath Chander M'] },
  { id: 'ORION-S0087', name: 'PERCEPTRON', count: 6, leader: 'Sanjai R', members: ['Yogapradeep B', 'Sabarish R', 'Sengan s', 'Vignesh R', 'Suriya M'] },
  { id: 'ORION-S0088', name: 'core signal', count: 6, leader: 'prasanna kumar', members: ['praveen kumar', 'Sanjeeth', 'Nivetha', 'Monika', 'Sabharish'] },
  { id: 'ORION-S0089', name: 'Technova', count: 4, leader: 'S.Lakshaya', members: ['Maha Lakshmi. G', 'Raevan karthik', 'Padmashree E K'] },
  { id: 'ORION-S0090', name: 'Fight club', count: 6, leader: 'M. SHEIK SHAHIN', members: ['VINAYAK YUDHANU', 'STEFIN SURYA R', 'SANJAY MURUGAN', 'TEJASWINI', 'VINOTHINI'] },
  { id: 'ORION-S0091', name: 'NEXORA', count: 6, leader: 'AGILESH M', members: ['GOWTHAM A', 'Mohammad tharif', 'THOTA YUVASENA', 'Sakthipriya B', 'Indujaa k'] },
  { id: 'ORION-S0092', name: 'Impact warriors', count: 4, leader: 'V DIVYESH', members: ['R V SENA VARSHAN', 'GOWTHAM S', 'YESHWANT C'] },
  { id: 'ORION-S0093', name: 'CodeMonkeys', count: 5, leader: 'Hari Vishva S', members: ['Yuvaraj H', 'Ahilesh Guru S', 'K Monasri', 'Devisri K'] },
  { id: 'ORION-S0094', name: 'Techmates', count: 3, leader: 'Samitha. K', members: ['Nandhini. V', 'Sreenidhi. S'] },
  { id: 'ORION-S0095', name: 'SALTVISIONAI', count: 4, leader: 'Mohammed Emtheyas S', members: ['DHANALAKSHMI K', 'Benadict thomas O.J', 'Lingesh M'] },
  { id: 'ORION-S0096', name: 'Nex 6', count: 6, leader: 'DILIPAN P', members: ['Sadhish R', 'Rashena l', 'Kalaimathi G', 'Keerthisha R', 'Joshitha S'] },
  { id: 'ORION-S0097', name: 'SPIDEYVERSE', count: 4, leader: 'Hemamalini K', members: ['Venkat Yokash K', 'PUGAZHARASI K', 'Sandhya B'] },
  { id: 'ORION-S0098', name: 'Quantum Force', count: 6, leader: 'B Gopinath', members: ['Kumaran S', 'Kathikeyan A', 'Kawsik M', 'Jitenra Rajan V', 'Jones Abhishek'] },
  { id: 'ORION-S0099', name: 'Riot', count: 4, leader: 'P. Pragathy', members: ['Lohit', 'Aadhil shajahan', 'Siddhi vinayak'] },
  { id: 'ORION-S0101', name: 'FLOWPILOT', count: 5, leader: 'Pranosh M', members: ['Praveen S', 'Rahim Khan S', 'Prajan M', 'Rahul S'] },
  { id: 'ORION-S0102', name: 'SYNC SQUAD', count: 6, leader: 'MOHAMED RIYASDEEN I', members: ['MOHAMMED ASIF N', 'VARSHINI S', 'ANSHIGA R', 'PREMA LATHA E V', 'JEEVAN S'] },
  { id: 'ORION-S0103', name: 'TENSOR TITANS', count: 5, leader: 'Jessica J', members: ['Kanisha Devi S', 'Harsha S', 'Meena Raj M.G', 'Kavya A'] },
  { id: 'ORION-S0104', name: 'KernelPanic', count: 6, leader: 'Aaruran. K', members: ['Abiraj.K', 'Ajay.S', 'Balamurugan.S', 'Dhinesh.N', 'Devavarnine.M'] },
  { id: 'ORION-S0105', name: 'OMEGA', count: 3, leader: 'R RITHWIK', members: ['C SHRAVAN KHANA', 'T kirthik'] },
  { id: 'ORION-S0106', name: 'Binary Titans', count: 2, leader: 'M.Madhuri', members: ['R. Shivaram'] },
  { id: 'ORION-S0107', name: 'NEXO', count: 2, leader: 'Ashwath M', members: ['G Dhanalakshmi'] },
  { id: 'ORION-S0108', name: 'FNATIC', count: 6, leader: 'Leema S', members: ['Divesh N', 'Mrudhula B', 'Abhinava Ashwin R', 'Mohammad Ejaz M', 'Mukeshkumar S'] },
  { id: 'ORION-S0109', name: 'TOUCH GRASS', count: 6, leader: 'TK DHARMESH KUMAR', members: ['SAMYUKTHA.V', 'SRUTHI.S', 'M.BHAVESH NATH', 'PB PRANAV RAM', 'P.SRI PRIYAN'] },
  { id: 'ORION-S0110', name: 'Codex', count: 6, leader: 'Praveen S', members: ['Mohammed Thamz', 'Monish M', 'Nirubanraaj J', 'Muthu durai S', 'Mohamed Aathif Jailani S'] },
  { id: 'ORION-S0111', name: 'Arvion', count: 6, leader: 'Pranesh Mithun G S', members: ['Nishmitha JS', 'NithyaShree T', 'Prithvi Kumaran R', 'Nivetha S', 'Prasanna Venkat G'] },
  { id: 'ORION-S0112', name: 'Vaishnavi devi G', count: 3, leader: 'Vaishnavi devi G', members: ['Thejesvani S', 'S G Yogitha'] },

  // Page 3
  { id: 'ORION-S0113', name: 'NOVARYN', count: 5, leader: 'Barathi Sankar M', members: ['Jeevadharani VG', 'Janani C', 'Jeevitha V', 'Dhanalakshmi S'] },
  { id: 'ORION-S0114', name: 'THE HEXA GEN', count: 5, leader: 'HRITHISHVAR', members: ['LOKESHWARAN', 'KAVYASRI', 'RITHIKASRI', 'HARINI JAISHANKAR'] },
  { id: 'ORION-S0115', name: 'KernelZero', count: 6, leader: 'Priyan', members: ['Arjjun S', 'Sathappan PL', 'Bala Tharun S', 'Saarvin GP', 'Raghul S'] },
  { id: 'ORION-S0116', name: 'Codenova', count: 5, leader: 'Praveena k', members: ['Prithika p', 'Ponmathi i', 'Ponmani M', 'Janani S'] },
  { id: 'ORION-S0117', name: 'Masterminds', count: 4, leader: 'Greeshma tarlana', members: ['Pragna boddu', 'Haripriya', 'Manikanta.G'] },
  { id: 'ORION-S0118', name: 'Jarvis 6.O', count: 5, leader: 'Roshan G', members: ['Sriabirami V', 'Saran E', 'Praveen raj V', 'Vidula C'] },
  { id: 'ORION-S0119', name: 'Veridia', count: 4, leader: 'Nadhiv Karuppuswamy', members: ['Mohammed Anas', 'M.A ROSHAN', 'SANTHOSH K'] },
  { id: 'ORION-S0120', name: 'FutureCode', count: 3, leader: 'Kevin Harris', members: ['Keerthi Shri', 'Lakshikanth'] },
  { id: 'ORION-S0121', name: 'Team trinity', count: 5, leader: 'Sudharsan R', members: ['Kavyasri P', 'Bavasree R', 'Pravin kumar D', 'Jeganath Kumar S'] },
  { id: 'ORION-S0122', name: 'Byteforce', count: 5, leader: 'Kishorekumar', members: ['Yogavin', 'Rishiraj', 'Rajeshwar', 'Divagar'] },
  { id: 'ORION-S0123', name: 'KNIGHT CODERS', count: 2, leader: 'Hareesh VN', members: ['Hevan Harish LM'] },
  { id: 'ORION-S0124', name: 'Hack Elite', count: 3, leader: 'OMSAIVAMSI V', members: ['Bala Adithya S U', 'Gnanaprakasam C'] },
  { id: 'ORION-S0125', name: 'Neural Ninjas', count: 5, leader: 'Theshna R', members: ['Amala abisha J', 'Rithika V', 'Shahel Netha M', 'Jennet Pauline D'] },
  { id: 'ORION-S0126', name: 'Astrivex', count: 3, leader: 'Sree Harsana K K', members: ['Rhaghav C', 'Pon Nivetha M'] },
  { id: 'ORION-S0127', name: 'HEXAverse', count: 6, leader: 'Pooja Kumar', members: ['Jeffrin M', 'Kaneska S M', 'Kaviya sri V', 'Kaniga P R', 'Kaviarasi D'] },
  { id: 'ORION-S0128', name: 'Forged In Code', count: 6, leader: 'Hareeni Pavendan', members: ['Deepika Shivani V', 'M.JAYASHRI', 'BA GURUPRIYA', 'Arulmozhi S', 'Ranjith S'] },
  { id: 'ORION-S0129', name: 'Zoro', count: 6, leader: 'Gayathri.K', members: ['Keerthiga.O', 'Kotteeswari.R', 'Balaji Aravind .R', 'Nitheshkumaran.S', 'Lalitha.M.J'] },
  { id: 'ORION-S0130', name: 'Cyber Rookies', count: 3, leader: 'Yuvaraj K', members: ['Subabalan S', 'Sanjay D'] },
  { id: 'ORION-S0131', name: 'Neuroforge', count: 6, leader: 'Hashvant S', members: ['S Bhavana Shree', 'Mahalakshmi V', 'Mithra K', 'Logitha L', 'T MADHESH KUMAR'] },
  { id: 'ORION-S0132', name: 'Varns', count: 6, leader: 'A.Harshith', members: ['M Lokeswara', 'Mukesh Chowdary', 'Kamal', 'Vamsi', 'Thoufiq'] },
  { id: 'ORION-S0133', name: 'PHOENIX PROTOCOL', count: 6, leader: 'SRI LAKSHMI V J', members: ['DEVIPRIYA R', 'THANVITHA DOMMARAJU C', 'VALERIN BRUCE', 'SATHYA K', 'SHARMISTHA K'] },
  { id: 'ORION-S0134', name: 'STRAW HATS', count: 2, leader: 'Roshan Anto W', members: ['Prabakar M'] },
  { id: 'ORION-S0135', name: 'Tech Space', count: 5, leader: 'Saran S', members: ['Shree Ram', 'VARUN J', 'VETRIVIGNESH', 'Manoj'] },
  { id: 'ORION-S0136', name: 'Breaking Code', count: 5, leader: 'Isaac Jacksonraj J', members: ['Kavinaya Bhaskaran', 'Jaya Joshna W', 'Jayaraj Rijan S', 'Indira M'] },
  { id: 'ORION-S0137', name: 'Claxon AI', count: 3, leader: 'SARRVESH J R', members: ['Sharulatha s', 'J Stevin jones'] },
  { id: 'ORION-S0138', name: 'Project Hail Mary', count: 4, leader: 'Dharani Karthikeyan', members: ['Larshikha Krishnan', 'Divya Dharshini K S', 'Hemapreiya Vijayaka'] },
  { id: 'ORION-S0139', name: 'HexaCore', count: 6, leader: 'SACHIN G S', members: ['Sanjeeve Rajan C R', 'Vuppalapati Vedesh', 'Hannish K', 'Aishwarya S', 'Roshini G'] },
  { id: 'ORION-S0140', name: 'PROTOTHON', count: 2, leader: 'BALIREDDI V V N S ABHISHEK', members: ['VIMAL RAJ A'] },
  { id: 'ORION-S0141', name: 'RunTime Error', count: 2, leader: 'Charen', members: ['Sai Sri Vathsan'] },
  { id: 'ORION-S0142', name: 'Hi-Tech', count: 5, leader: 'Irina Charis B', members: ['Harish S', 'Krithika A M', 'Jaya Surya S G', 'Hemanth Raju'] },
  { id: 'ORION-S0143', name: 'FineWorks', count: 6, leader: 'Praveen Balaji G', members: ['Saranesh S', 'Nitish M', 'Sakthi Saran G', 'Seerthi Adhavan', 'Tazim Sheriff R'] },
  { id: 'ORION-S0144', name: 'Rebellions', count: 6, leader: 'Lokesh S', members: ['M Mohamed Rasool', 'Darsan G R', 'Giridharan M', 'Abdul Majeed A', 'Dhinesh'] },
  { id: 'ORION-S0145', name: 'SylvaAI', count: 4, leader: 'Pooja S', members: ['Vani S', 'Meiram R', 'Ramamoorthy K'] },
  { id: 'ORION-S0146', name: 'Tech Hackers', count: 6, leader: 'DIVYA T', members: ['Geethalakshmi B', 'Jahnavi R', 'Giri P', 'Deepak N S', 'Hariharasuthan N'] },
  { id: 'ORION-S0147', name: 'Code Charms', count: 6, leader: 'Elakkiya.R', members: ['Devadharshini.S', 'ANANYA.R', 'Keerthana.S', 'GAAYATHRI DEVI R', 'BILLU SHARIKA'] },
  { id: 'ORION-S0148', name: 'Voro', count: 6, leader: 'Lalith Aditiya T A', members: ['Kumaran R', 'Likesh R', 'Kishor J', 'Krishna megha K S', 'Kavi priya A'] },
  { id: 'ORION-S0149', name: 'Mesh Minds', count: 6, leader: 'Tejasvini S', members: ['Syed Amrullah S A', 'Chitra Devi R', 'Praveen B', 'Anoob S', 'Jagadeesh R'] },
  { id: 'ORION-S0150', name: 'NexQ', count: 4, leader: 'Ananya Sridhar', members: ['Anantha Kumar B', 'Avinash S', 'Devikala M'] },
  { id: 'ORION-S0151', name: 'DoomCoders', count: 5, leader: 'C Balaji Mohan', members: ['Abhikash S', 'Adheep S', 'Avinash V', 'Siva Sitharthan N'] },
  { id: 'ORION-S0152', name: 'Tech Titans', count: 6, leader: 'R R Jaiwanth', members: ['A Sai Hariharan', 'N.Mughilan', 'P.Jane Merlin', 'A.Jayavarshini', 'M.Rakshana'] },
  { id: 'ORION-S0153', name: 'TechCode', count: 4, leader: 'Devipriya B', members: ['Sakthi Devi L', 'Naveen K', 'Thulasi raman M'] },
  { id: 'ORION-S0154', name: 'MotwaGuard', count: 6, leader: 'Monica V', members: ['Karthikeyan B', 'Velvizhi K', 'Deepika M', 'Ram Prasath G', 'Dhinesh Kumar V'] },
  { id: 'ORION-S0155', name: 'StarByte', count: 3, leader: 'Jaidev S', members: ['Karthikeyan S', 'Senthamizharan V'] },
  { id: 'ORION-S0156', name: 'O[1]', count: 6, leader: 'M. Shirish', members: ['Shirish M', 'Shanjana s v', 'Akilesh B', 'Akshaya Beena', 'Ben'] }, // Note: Shirish M duplicate
  { id: 'ORION-S0157', name: 'Astralis', count: 4, leader: 'yaathesh', members: ['Senthur pandian', 'Aruthran', 'Ponvel.G'] },
  { id: 'ORION-S0158', name: 'Mindsprint', count: 5, leader: 'Frezha Angeline A', members: ['Dhanalakshmi K', 'Nidhya Shree U', 'Reya S', 'Janani S'] },
  { id: 'ORION-S0159', name: 'Technocrats', count: 5, leader: 'Gunanithi M', members: ['Balarishikesh B S', 'Hari Krishna V', 'Bala Murali S', 'Aswindh Kumar R'] },
  { id: 'ORION-S0160', name: 'ProofForge', count: 3, leader: 'Jerlin Goldia.J', members: ['Nandhini R', 'Jessica T'] },
  { id: 'ORION-S0162', name: 'avengers codesday', count: 6, leader: 'M J Dhurgesh', members: ['Harisudhan', 'Sanjaidharshan s', 'Tharun S', 'Kabilan', 'Shakeel irfan A r'] },

  // Page 4
  { id: 'ORION-S0163', name: 'NOVERA', count: 6, leader: 'SUDHARSAN B', members: ['GANESH A S', 'MOHAMED ROSHAN S', 'SANJEEV J', 'SAI NIKITHA', 'SAI HARIKA NANU'] },
  { id: 'ORION-S0164', name: 'Clarabella', count: 6, leader: 'K SHALINI', members: ['SRINITHA G P', 'ANBU SELVAN S', 'Aravind .R', 'Arjun.p', 'Venureddy'] },
  { id: 'ORION-S0165', name: 'DR DOOM', count: 4, leader: 'KRITHIKAA B', members: ['ADITHYA S', 'S JISHNUMUGUNTH', 'MANIESWARI M V'] },
  { id: 'ORION-S0166', name: 'CODE CRACKERS', count: 6, leader: 'Monish R', members: ['Vasantharaj M', 'Harishankar E', 'Kaavinesh K', 'Roshan B', 'Mohan K'] },
  { id: 'ORION-S0167', name: 'GAITHUB', count: 6, leader: 'Santosh Raghavendra Y S', members: ['RAKSHAN RS', 'Yuvan krishnan', 'Mario Ralph Baxter', 'Udhaya', 'Mithran'] },
  { id: 'ORION-S0168', name: 'NOVATRIX', count: 6, leader: 'PRAVEEN KUMAR M', members: ['RAGURAM.A', 'SACHIN RAJA.R', 'Rithish Barath N', 'SACHIV.R', 'SAKTHI.T C'] },
  { id: 'ORION-S0169', name: 'Hack Aspirants', count: 4, leader: 'keerthaesh kumar M', members: ['kavya S', 'karishma D', 'bharath N'] },
  { id: 'ORION-S0170', name: 'Bhairav', count: 6, leader: 'Vinish Vinoth', members: ['BARATH D', 'SANTHOSH KUMAR V', 'SAI SANTHOSH T', 'Janani sri', 'Pooja Laxmi'] },
  { id: 'ORION-S0171', name: 'Change Making engineers', count: 5, leader: 'Suthakar P', members: ['Devadharshini R', 'Deepa G', 'Aravind I', 'A.DHANUSRI'] },
  { id: 'ORION-S0172', name: 'FastLane Devs', count: 6, leader: 'K.Harshith', members: ['M.Srikanth', 'U.Veerendra', 'J.Rasmitha sai', 'K.nikhil reddy', 'S.Bharath'] },
  { id: 'ORION-S0173', name: 'Crypto knights', count: 6, leader: 'Udhaya Raghavi S', members: ['Shruthilaya RP', 'Sindhya sridharan', 'Varnikha sri', 'Shreya S', 'Shadhana'] },
  { id: 'ORION-S0174', name: 'Techno sist', count: 4, leader: 'Aathimaduran. S', members: ['Ahmed Azeer. A', 'Charan. G', 'Vijayan. S. K'] },
  { id: 'ORION-S0175', name: 'MADMAXX', count: 6, leader: 'Abinandhana A', members: ['ANIKASRI.B', 'PRIYADHARSHINI S', 'Aarthi S', 'Sunethra J', 'Jerusha W'] },
  { id: 'ORION-S0176', name: 'VIBRANT', count: 6, leader: 'HARIHARAN D', members: ['Dhanush S', 'Julian Steve Anban', 'R Sanjay', 'Aanish Nithin', 'T R Ajay Dharrsan'] },
  { id: 'ORION-S0177', name: 'Team swam', count: 6, leader: 'Yamini. S', members: ['Priyadharshini. H', 'Padma Priya. R', 'Sabishree. R', 'Dharun. M', 'Philips Gabriel B'] },
  { id: 'ORION-S0178', name: 'Null exceptions', count: 6, leader: 'S MONIKA', members: ['Sheik abdhulla', 'Yuvanesh', 'Rahul', 'Harshini', 'Aswathy'] },
  { id: 'ORION-S0179', name: 'CODECREW', count: 5, leader: 'Nithiya Sri G', members: ['Logeswari A', 'Nivetha S', 'Lekkala Pranathi', 'Kanimozhi'] },
  { id: 'ORION-S0180', name: 'cyber crew', count: 5, leader: 'Lithesh B', members: ['lohendra C', 'Kirankumar P', 'Karthick S', 'Sri abinandhan S'] },
  { id: 'ORION-S0181', name: 'Techaura', count: 4, leader: 'Harini A', members: ['Nandhini V', 'Ramya D', 'Amirthavarshini P'] },
  { id: 'ORION-S0182', name: 'Phoenix coders', count: 6, leader: 'Sameer C', members: ['M.R.Magdalene', 'Aakshy Sharon J R', 'Chinthaamani R M', 'SATHIYA NARAYANAN S', 'B.jayanth swamy'] },
  { id: 'ORION-S0183', name: '_ENDEAVOUR_', count: 6, leader: 'RAGHUL T', members: ['AJAY P', 'RAGHAV S', 'RAGHUL K', 'MOVIN T', 'SHARVESH S'] },
  { id: 'ORION-S0184', name: 'Compilers', count: 6, leader: 'Sasikumar S', members: ['Gowtham Thirumuru', 'Sachin Rao', 'Sreeja R', 'Rakesh D', 'Ram P'] },
  { id: 'ORION-S0185', name: 'Codespark', count: 4, leader: 'Keerthana K', members: ['Muthu Prabha', 'Dharshana S', 'Gifta Alice'] },
  { id: 'ORION-S0186', name: 'Espiron', count: 5, leader: 'Vishhwa vasudevan', members: ['Yogitha M', 'Gautham K', 'Jeyandhana Amirthi', 'Yogeshwaran M'] },
  { id: 'ORION-S0187', name: 'Sleepless Knight', count: 5, leader: 'Lynton Oreb', members: ['Dharshini V', 'Hemamalini V', 'Mukilan S', 'Prithiviraj S'] },
  { id: 'ORION-S0188', name: 'NexGen', count: 5, leader: 'ERIN RAICHEAL JUVENAL', members: ['Antony Jernaus J', 'Haashini M', 'Vishal V M', 'Yokeshkumar S'] },
  { id: 'ORION-S0189', name: 'B NIRANJAN', count: 4, leader: 'NIRANJAN', members: ['NITISH P', 'Pranov P', 'Nithivalavan D', 'Navin SD'] },
  { id: 'ORION-S0190', name: 'ARIV — AI & Research Innovators with Vision', count: 6, leader: 'SHAPTHAGIRI G', members: ['UMAIRA FATHIMA Z', 'SHAHIRA M', 'RENGESH M', 'SAI SARAN N', 'SAHANA E'] },
  { id: 'ORION-S0191', name: 'Bytebros', count: 5, leader: 'Santhosh S', members: ['Sharpika M', 'Sravani L A', 'Riya Denio J', 'Ragavendhra G'] },
  { id: 'ORION-S0192', name: 'NextGen Innovators', count: 6, leader: 'Yazhini SP', members: ['Shakthi Priya B', 'Dhanushree A', 'Livasha M', 'Kirubhanandham S G', 'Santhosh Udaiyar'] },
  { id: 'ORION-S0193', name: 'TEAM VOID', count: 5, leader: 'Antony Xavier J M', members: ['Rahul V', 'Kavya P', 'Harshini S', 'Mathivadani A'] },
  { id: 'ORION-S0194', name: 'alpha safety', count: 6, leader: 'Bhuvan K', members: ['selva kumaran P', 'Bavya S', 'Rubika P', 'sathya priya P', 'kishore B'] },
  { id: 'ORION-S0195', name: 'Ctrl freaks', count: 6, leader: 'KAVIYA B', members: ['KANISHKA V S', 'KARTHIKEYAN M', 'KEERTHIKA J', 'KARTHIGAENI SINGARAV', 'KEERTHANAA G'] },
  { id: 'ORION-S0196', name: 'TerraVision AI', count: 6, leader: 'Sudharshan', members: ['Wilson Christhu dos', 'Rajesh', 'Yogasree', 'Santhosh', 'Beulah'] },
  { id: 'ORION-S0197', name: 'Top gun', count: 6, leader: 'deepak', members: ['GOWTAM ADITYA', 'KAMLESH ADITHYA', 'KRITHIK NITHIN S T', 'SHREESHANTH', 'PURJITH KRISHNA'] },
  { id: 'ORION-S0198', name: 'Cyber Kiddies', count: 6, leader: 'Jesin Milesh M', members: ['Libinesh R U', 'Jeshwanth V', 'Jeeva D', 'Madeshwaran P', 'Ashish N'] },
  { id: 'ORION-S0199', name: 'PREETHI A', count: 3, leader: 'PREETHI A', members: ['VINOTHINI T', 'MOHANA P Y'] },
  { id: 'ORION-S0200', name: 'Binary Brains', count: 4, leader: 'Naveena R', members: ['Pranav A', 'Praveen L R', 'Pooja R'] },
  { id: 'ORION-S0201', name: 'Hackhive', count: 4, leader: 'JEYASHREE V', members: ['HARSITHA C', 'KAVIBHARATHI M', 'JENITHAASRI M'] },
  { id: 'ORION-S0202', name: 'Yokeshwaran', count: 4, leader: 'Yokeshwaran', members: ['Sudharshan R', 'Sudesh pranav E.S', 'Sateendar H'] },
  { id: 'ORION-S0203', name: 'elytra tech', count: 3, leader: 'samuel joel ponraj', members: ['samuel varghese', 'paul jeromae'] },
  { id: 'ORION-S0204', name: 'Dronai', count: 3, leader: 'Rannadeer kumar seetha', members: ['Nanda Kishore Chav', 'Arshad s'] },
  { id: 'ORION-S0205', name: 'CrackAura', count: 6, leader: 'SRIRAM M', members: ['Vandhana Murugan', 'Vimaladhithya C V', 'Vedhika N', 'Thuthiksha bhavana', 'Janani S'] },
  { id: 'ORION-S0206', name: 'The Creators', count: 6, leader: 'Sweety Vincent', members: ['Swapna R V', 'Ruba Darshni J', 'Srinitharaj', 'Sruthi Krishnan', 'Kavivarshni G'] },
  { id: 'ORION-S0207', name: 'Quantum Minds', count: 4, leader: 'manasvi sachin jagtap', members: ['madhura sunil pawa', 'shivani appa vyavahare', 'Sandesh shivaji bong'] },
  { id: 'ORION-S0208', name: 'git commit -m "Victory"', count: 4, leader: 'Daniel Sebastin A', members: ['Ramya Clemenceau', 'Javid Ali A', 'Gokhul A'] },
  { id: 'ORION-S0209', name: 'Binary Brains', count: 5, leader: 'GONEDA Tushar Karthik', members: ['Mallipeddi omsaitej', 'Challapareddy Ram Charan', 'M S N V Chandra Mo', 'Akkineni Sai Venkat'] },
  { id: 'ORION-S0210', name: 'Hack Hype', count: 6, leader: 'Nandhini', members: ['Harshini D', 'Kirithika. A', 'Roshith O', 'Sastha S', 'Nirmalkumar M'] },
  { id: 'ORION-S0211', name: 'LinkupLaps', count: 6, leader: 'Prakash R', members: ['Prasanna K', 'Pranav GS', 'Piraisoodan R', 'Nithyanandh BS', 'Rajeshwar S'] },

  // Page 5
  { id: 'ORION-S0212', name: 'Debug Divas', count: 6, leader: 'Atchaya M S', members: ['priyadharshini J', 'Aarthi V', 'Harini J', 'Renuka R', 'suriyakala S'] },
  { id: 'ORION-S0213', name: 'AquaByte', count: 3, leader: 'MOHAMED RIYASKHAN S', members: ['Santhosh S', 'Ramkumar K', 'Rohit R S'] },
  { id: 'ORION-S0214', name: 'Code Forge', count: 5, leader: 'Vaarshini B', members: ['Palaneappan M', 'Harini B', 'Sumurthaa V', 'Mutthu M'] },
  { id: 'ORION-S0215', name: 'ALGOS', count: 5, leader: 'Vishnu D', members: ['Raja Thinakaran V', 'Riya R', 'Tharika Nayaki S', 'Yuvaraj C'] },
  { id: 'ORION-S0216', name: 'C0DE RED', count: 4, leader: 'Sagaar suresh', members: ['Ritthiga B', 'Venkatesan R', 'Rithika V'] },
  { id: 'ORION-S0217', name: 'TechAura', count: 4, leader: 'K.Shri vijaya harini', members: ['Roshini A', 'Nasiba', 'Nusurath fathima'] },
  { id: 'ORION-S0218', name: 'Sparks', count: 6, leader: 'Vilina K', members: ['Varuna V', 'Varshini R', 'Sriharini K', 'Stephy Alice Christy D', 'Sri Varshini V'] },
  { id: 'ORION-S0219', name: 'INQORA', count: 6, leader: 'X.KRECENCIA', members: ['HARISH BABU M', 'SURYA G V', 'THANUSHREE K S', 'ANUGRAHA SAJI', 'Shaai Ganesh P'] },
  { id: 'ORION-S0220', name: 'The Quantum Coders', count: 6, leader: 'Sivanandham G', members: ['Srikanth Y', 'Richardson S', 'Ukesh Kumar R', 'Giridharan V', 'Ragav Rathinam V'] },
  { id: 'ORION-S0221', name: 'Team titans', count: 6, leader: 'AKSHAYA K 111625201005', members: ['Dhiya R', 'Dharshini PV', 'Harshitha V', 'Bhuvana Lakshmi B', 'Heena S.V'] },
  { id: 'ORION-S0222', name: 'NeuroFlux', count: 4, leader: 'Madhumitha T K', members: ['Malathi S', 'Nevetha D', 'Mariammal M'] },
  { id: 'ORION-S0223', name: 'Deep Matrix', count: 6, leader: 'V Hari Krishnan', members: ['A Lohit', 'Ruhan Prasad S', 'Aravintakshan A L', 'Nithin K', 'Sri Aarush Tej N'] },
  { id: 'ORION-S0224', name: 'Shadow_Monarch', count: 2, leader: 'Pavan Kumar', members: ['Karunya'] },
  { id: 'ORION-S0225', name: 'Yeah squad', count: 6, leader: 'Rubendran V', members: ['Sanjay K', 'Ravisankar J', 'Sundaresan K', 'Sivaganesh S', 'Sudharshan A'] },
  { id: 'ORION-S0226', name: 'Doddlebug', count: 4, leader: 'Avinash Venkatraman', members: ['LAKSHMIPRIYA S', 'Dharshini M', 'Aravind Kumar P'] },
  { id: 'ORION-S0227', name: 'Tech innovator', count: 4, leader: 'Pragadeshwaran', members: ['Priya. S', 'Varshini. S'] },
  { id: 'ORION-S0228', name: 'Eagerists', count: 6, leader: 'Deepa Ganesh J', members: ['Elancholan P', 'Aravindhane VS', 'Jayakips Antony', 'Jeevesh M', 'Rajaneesh'] },
  { id: 'ORION-S0229', name: 'Coderzz', count: 2, leader: 'Sneha J', members: ['Sasidharan K'] },
  { id: 'ORION-S0230', name: 'PARAGON', count: 3, leader: 'Sai Sowndiriyaa T', members: ['Sai Sruthi S', 'Sanjai B'] },
  { id: 'ORION-S0231', name: 'Corex', count: 6, leader: 'Parthasarathi M', members: ['Muniraja P.M', 'MUGESHKUMAR M', 'MUKUNDAN T', 'Mohan Raj N', 'PRASHANTH H'] },
  { id: 'ORION-S0232', name: 'Galactic Force', count: 4, leader: 'C.Tarunarayan', members: ['Guru Varshini', 'Melvin Prince Rohan', 'R Mithun Kumar'] },
  { id: 'ORION-S0233', name: 'Code titans', count: 2, leader: 'Sabareesh', members: ['Madhumithaa Kathir'] },
  { id: 'ORION-S0234', name: 'Alpha', count: 3, leader: 'Sharvesh S', members: ['Siddharth P', 'Sarveshvijay K'] },
  { id: 'ORION-S0235', name: 'Bleach', count: 5, leader: 'Sriya Bheema', members: ['Mohan Nikitha', 'N . Sabareesh raam', 'Sabarish. S', 'Sainath P'] },
  { id: 'ORION-S0236', name: 'Cupid.exe', count: 2, leader: 'Sachin R', members: ['Sangeetha P'] },
  { id: 'ORION-S0237', name: 'Team Endeavours', count: 3, leader: 'Srirangapprasath I', members: ['Sudharsan S', 'Srirangapprasath I'] }, // Note: Srirangapprasath duplicate
  { id: 'ORION-S0238', name: 'AQUABOTS', count: 6, leader: 'DHIVYASHRI S', members: ['DEVASHRI S', 'FARHANUDIN B', 'SULAKA B', 'NEERAJA S', 'THOLKAPPIYAN Y'] },
  { id: 'ORION-S0239', name: 'Quinex', count: 6, leader: 'K.Sabana Banu', members: ['R.Pavithra', 'M.Muthu Vetha Varshini', 'R.Abirami', 'S.Aishwarya Lakshmi', 'S.Akshaya'] },
  { id: 'ORION-S0240', name: 'DSCE', count: 4, leader: 'Nadin S', members: ['Mokeshwaran G', 'Mathuravel G', 'Manojkumar J'] },
  { id: 'ORION-S0241', name: 'Tech Tetra', count: 4, leader: 'Kavisri A', members: ['Janani N', 'Ashni JV', 'Nivi R'] },
  { id: 'ORION-S0242', name: 'Epsilon', count: 6, leader: 'Sanchita S', members: ['Thilak Raj V', 'Sheniga Sam Robert Jasmine', 'R Miraculin Rose', 'Ahmad Faiyaz', 'M D Nafiz Ahmed'] },
  { id: 'ORION-S0243', name: 'AI INFINITY', count: 6, leader: 'Jibriya Begam A', members: ['Lakshayaa', 'Nisha', 'Logeshwar K', 'Janarthanan D', 'Nizamudeen S'] },
  { id: 'ORION-S0244', name: 'AXION', count: 6, leader: 'VASANTHAKUMAR S', members: ['AAKASH K', 'NISMA FATHIMA N', 'BHIBISHA JASMINE', 'KAVIYASHREE T', 'VIJAY SHARMA J'] },
  { id: 'ORION-S0245', name: 'DayOne', count: 6, leader: 'R S M Sri Vishnu', members: ['Varshen S C', 'Vishnu M', 'Anbu Selvan T', 'Sanjith V', 'Harsshan S'] },
  { id: 'ORION-S0246', name: 'Algorise', count: 5, leader: 'Krishna Karthi', members: ['Dhatshna S', 'Kiruba', 'Maha lakshmi', 'Kiruthika'] },
  { id: 'ORION-S0247', name: 'Syntax Errorist', count: 5, leader: 'Keerthika J', members: ['Harshini Priya V', 'Asvika N', 'Dande Varshitha', 'Janani J'] },
  { id: 'ORION-S0248', name: 'CodeMax', count: 3, leader: 'Ili. Srinidhi', members: ['Suram Varshini', 'Gajula Vedhasree'] },
  { id: 'ORION-S0249', name: 'Technoverse', count: 6, leader: 'Lohith kumar R', members: ['GokulJayandan R S', 'Kiranraj M', 'P S kishore', 'Ganapathy B', 'Ganapathy B'] }, // Note: duplicate member
  { id: 'ORION-S0250', name: 'ADAM', count: 6, leader: 'Archana R', members: ['Dhanush Krishna sp', 'mega varsan VE', 'Nandhana H B', 'Atchaya B', 'Jonish Antony A'] },
  { id: 'ORION-S0251', name: 'Tech Morphers', count: 6, leader: 'Naveen Kumar R', members: ['Sruthi V', 'Thakshinya B', 'Dharaniga K', 'Moses Shaam M J', 'Shrivatsan M'] },
  { id: 'ORION-S0252', name: 'Ecospectra', count: 4, leader: 'Sri Balaji S', members: ['Alfin Isaac', 'Guru Priyan', 'Shri Veeran'] },
  { id: 'ORION-S0253', name: 'Alpha coders', count: 6, leader: 'Mohammed abdul muqeet ahmed', members: ['Sanjay S', 'SHEIK ABDULLAH.N', 'Andrey fredrick', 'rohit srirajan', 'Joseph snowin S'] },
  { id: 'ORION-S0255', name: 'WHITE DOTS', count: 3, leader: 'Harrish T', members: ['K N ASWIN', 'Barathraj P H'] },
  { id: 'ORION-S0256', name: 'Dual Core', count: 2, leader: 'Mohammed Ashiq', members: ['Subashini'] },
  { id: 'ORION-S0257', name: 'Apex Heroes', count: 6, leader: 'Abinav Sreenivas M', members: ['Ashwin Joe R', 'Siranjeevikaruppaiyan P', 'Divagar S', 'Balaji V', 'Vishnu P'] },
  { id: 'ORION-S0258', name: 'Crack Dots', count: 3, leader: 'aswin kumaragurubaran', members: ['Elamaran A', 'Jagadeeshwaran S'] },
  { id: 'ORION-S0259', name: 'Obscura', count: 5, leader: 'BHUVAN BHANDARI B', members: ['DHANUSHRI A', 'ASHIF HUSSAIN M', 'JEEVA KUMAAR S', 'ANUSH R'] },
  { id: 'ORION-S0260', name: 'Infinix', count: 6, leader: 'S Neha', members: ['Ritika S', 'Sugantha G', 'Syed Israr Ahmed G', 'Kishore P', 'C M Sharvesh'] },
  { id: 'ORION-S0261', name: 'Codex', count: 6, leader: 'Sahana M', members: ['Tarifa Fathima', 'Swetha M', 'Tanushree R', 'Lakshmi K V', 'Yadhana A'] },

  // Page 6
  { id: 'ORION-S0262', name: 'Quantum Coders', count: 6, leader: 'Kishore B', members: ['Tarunika V', 'Vasanth R', 'Gokul Raj K', 'Kameesvar N', 'Saravanan S'] },
  { id: 'ORION-S0263', name: 'QuadraX', count: 4, leader: 'Aditya Krishnan A', members: ['VENKATESH R.P', 'JASIM FAREES J', 'DHIVESH A'] },
  { id: 'ORION-S0264', name: 'ERROR404', count: 4, leader: 'Sanjay.C', members: ['Satyajith.M', 'Sanjay Udayashankar', 'Sarika.R'] },
  { id: 'ORION-S0265', name: 'THE DECODERS', count: 4, leader: 'SAI HARISH M', members: ['SAI NIRMAL N', 'SHAILESH P S', 'PRASANTTH SAI G'] },
  { id: 'ORION-S0266', name: 'WHITE DEVILS', count: 4, leader: 'S.KAILASHWAR', members: ['PRABIN PS', 'DEEPIKA K', 'DEWANSH SINGH'] },
  { id: 'ORION-S0267', name: 'CODEX', count: 6, leader: 'SAM GODWIN A', members: ['Jeffrin Lino Shalom', 'PARVESH R', 'CHINTANASRI R', 'GOKULPATHY L', 'MATHIYAZHAGI S'] },
  { id: 'ORION-S0268', name: 'Inglourious Hackers', count: 3, leader: 'CHUKISIVAM VS', members: ['Sivasanjay M', 'Krithika S'] },
  { id: 'ORION-S0269', name: 'RENTRO', count: 6, leader: 'P.S.Abinaya', members: ['VARSHA P J', 'MADHUMITHA S', 'LAKSHITHA S', 'R.HARINE', 'B.Divya'] },
  { id: 'ORION-S0270', name: 'BRAINROT', count: 6, leader: 'Gokila kumara chandru S', members: ['Aswin Sharma .S', 'Amruth S', 'BEO SJ PRAKASH', 'Sri Prithviraj RB', 'Sharathi A'] },
  { id: 'ORION-S0271', name: 'Team apex', count: 5, leader: 'Mani Govindan S', members: ['Sirajan. A', 'M. Sakthibalan', 'RAJAGUGAN C', 'Karthigeyan. R'] },
  { id: 'ORION-S0272', name: 'Syntax', count: 3, leader: 'Rakshitha Pearlin.F', members: ['Narendra Naidu', 'Laranya'] },
  { id: 'ORION-S0273', name: 'Rocks', count: 6, leader: 'Athi Narayanan', members: ['Vimal Varshit V', 'Sanjay B', 'Mukkeshnarayan JR', 'Arulraj sekhar d', 'Ameer K'] },
  { id: 'ORION-S0274', name: 'Undefined Behaviour', count: 5, leader: '312425148034 MISHALI B S', members: ['Sharvesh S', 'Nilofar Banu S', 'Arikarthikessan S', 'Kishorr Manickam B'] },
  { id: 'ORION-S0275', name: 'BOULT', count: 6, leader: 'YUVARAJ S', members: ['VIJAYABALAJI D', 'GNANDEEP P', 'THIRUKUMARAN V', 'VISHAL R', 'YUVARAJ S'] }, // Note: YUVARAJ S duplicate
  { id: 'ORION-S0276', name: 'NeuroNex', count: 6, leader: 'Teja Sri M', members: ['Sakthivel A', 'Saraboji S', 'Sowmiya M', 'Supriya D', 'Sanjay S'] }
];

// Helper to normalize names for comparison
function norm(str?: string): string {
  return (str || '').toLowerCase().replace(/[^a-z0-9]/g, '');
}

function isNameMatch(a?: string, b?: string): boolean {
  if (!a || !b) return false;
  const cleanA = norm(a);
  const cleanB = norm(b);
  if (cleanA && cleanB && cleanA === cleanB) return true;

  // Compare sorted word tokens (e.g. "M. Shirish" vs "Shirish M")
  const tokensA = a.toLowerCase().replace(/[^a-z0-9\s]/g, '').trim().split(/\s+/).filter(Boolean).sort().join(' ');
  const tokensB = b.toLowerCase().replace(/[^a-z0-9\s]/g, '').trim().split(/\s+/).filter(Boolean).sort().join(' ');
  if (tokensA && tokensB && tokensA === tokensB) return true;

  // If both have initials and they differ, they are distinct people (e.g. "Raghul T" vs "Raghul K")
  const initialsA = a.toLowerCase().replace(/[^a-z0-9\s]/g, '').trim().split(/\s+/).filter(w => w.length === 1);
  const initialsB = b.toLowerCase().replace(/[^a-z0-9\s]/g, '').trim().split(/\s+/).filter(w => w.length === 1);
  if (initialsA.length > 0 && initialsB.length > 0) {
    if (initialsA.sort().join('') !== initialsB.sort().join('')) {
      return false;
    }
  }

  // If one has no initial and the main name is identical (e.g. "Shirish" vs "M. Shirish")
  const wordsA = a.toLowerCase().replace(/[^a-z0-9\s]/g, '').trim().split(/\s+/).filter(w => w.length > 1).sort().join(' ');
  const wordsB = b.toLowerCase().replace(/[^a-z0-9\s]/g, '').trim().split(/\s+/).filter(w => w.length > 1).sort().join(' ');
  if (wordsA && wordsB && wordsA === wordsB) return true;

  return false;
}

// Helper to slugify username
function slugifyUsername(teamName: string, regId: string): string {
  const s = teamName.toLowerCase().replace(/[^a-z0-9]/g, '');
  return s || regId.toLowerCase().replace(/[^a-z0-9]/g, '');
}

// Helper to create access token
function createPasscode(leaderName: string, regId: string): string {
  const s = leaderName.toUpperCase().replace(/[^a-zA-Z0-9]/g, '');
  return s || regId.toUpperCase().replace(/[^a-zA-Z0-9]/g, '');
}

export function buildCleanRecords() {
  const now = new Date().toISOString();
  const processedTeams: TeamRecord[] = [];
  const processedPayments: PaymentRecord[] = [];
  const duplicateFlags: { team: string; removed: string; reason: string }[] = [];

  for (const squad of RAW_ROSTER) {
    const seenMembers: string[] = [];
    const cleanedMembers: TeamMember[] = [];

    for (const rawM of squad.members) {
      const cleanM = rawM.trim();
      if (!cleanM || cleanM.toUpperCase() === 'NULL' || cleanM === '-') continue;

      // 1. Check if duplicate of leader
      if (isNameMatch(cleanM, squad.leader)) {
        duplicateFlags.push({
          team: `${squad.id} (${squad.name})`,
          removed: cleanM,
          reason: `Duplicate of Team Leader (${squad.leader})`
        });
        continue;
      }

      // 2. Check if duplicate of already seen member in this squad
      if (seenMembers.some(prev => isNameMatch(cleanM, prev))) {
        duplicateFlags.push({
          team: `${squad.id} (${squad.name})`,
          removed: cleanM,
          reason: 'Duplicate member within squad'
        });
        continue;
      }

      seenMembers.push(cleanM);

      cleanedMembers.push({
        id: crypto.randomUUID(),
        team_id: squad.id,
        team_name: squad.name,
        member_number: cleanedMembers.length + 1,
        member_name: cleanM,
        member_phone: '',
        member_email: '',
        department: 'Engineering',
        year: 'Student'
      });
    }

    const teamUuid = crypto.randomUUID();
    const teamRecord: TeamRecord = {
      id: teamUuid,
      registration_id: squad.id,
      team_name: squad.name,
      username: slugifyUsername(squad.name, squad.id),
      leader_name: squad.leader,
      leader_phone: '',
      leader_email: '',
      institution: 'Sathyabama Institute of Science and Technology',
      department: 'Engineering',
      year: 'Student',
      problem_statement: 'ORION-PS-01',
      access_token: createPasscode(squad.leader, squad.id),
      payment_status: 'VERIFIED',
      amount: 100,
      registration_status: 'REGISTERED',
      round_1_status: 'SUBMISSION_OPEN',
      round_2_status: 'LOCKED',
      round_1_score: null,
      evaluation_scores: null,
      admin_notes: 'Updated official verified roster (2026-09-08)',
      suspicion_flags: [],
      members: cleanedMembers.map(m => ({ ...m, team_id: teamUuid })),
      submissions: [],
      resubmission_requests: [],
      audit_logs: [
        {
          id: crypto.randomUUID(),
          team_id: teamUuid,
          team_name: squad.name,
          action: 'PAYMENT_VERIFIED',
          actor: 'Admin Secretariat',
          details: 'Official verified roster imported — Payment verified & Round 1 unlocked',
          created_at: now
        }
      ],
      created_at: now,
      updated_at: now
    };

    const paymentRecord: PaymentRecord = {
      id: crypto.randomUUID(),
      team_id: teamUuid,
      utr_number: `VERIFIED-${squad.id}`,
      payer_name: squad.leader,
      payer_upi: 'official@upi',
      amount: 100,
      payment_status: 'VERIFIED',
      screenshot_url: undefined,
      notes: 'Verified from official Secretariat roster',
      submitted_at: now,
      verified_at: now,
      verified_by: 'Admin Secretariat'
    };

    teamRecord.payment = paymentRecord;
    processedTeams.push(teamRecord);
    processedPayments.push(paymentRecord);
  }

  return { processedTeams, processedPayments, duplicateFlags };
}

// Generate the SQL migration string
export function generateSqlMigration(teams: TeamRecord[]): string {
  const escapeSql = (s?: string) => (s || '').replace(/'/g, "''");

  let sql = `-- ==============================================================================
-- 019 — Official Updated Verified Roster Import (260 Squads)
-- ==============================================================================
-- 
-- Purges old entries and imports the 260 official squads.
-- All squads are set to payment_status = 'VERIFIED' and round_1_status = 'SUBMISSION_OPEN'.
-- Duplicate team leader names in member slots have been stripped.
--
-- Apply this script in Supabase SQL Editor.

begin;

-- 1. Clean previous registrations, payments and member associations
delete from public.team_members;
delete from public.payments;
delete from public.submissions;
delete from public.resubmission_requests;
delete from public.suspicion_flags;
delete from public.audit_logs;
delete from public.teams;

-- 2. Insert all 260 squads
`;

  for (const t of teams) {
    const tId = t.id;
    const regId = escapeSql(t.registration_id);
    const tName = escapeSql(t.team_name);
    const uName = escapeSql(t.username);
    const lName = escapeSql(t.leader_name);
    const pass = escapeSql(t.access_token);
    const inst = escapeSql(t.institution);
    const ps = escapeSql(t.problem_statement);
    const now = t.created_at;

    sql += `
insert into public.teams (
  id, registration_id, team_name, username, leader_name, leader_phone, leader_email,
  institution, department, year, problem_statement, access_token,
  payment_status, amount, registration_status, round_1_status, round_2_status,
  admin_notes, created_at, updated_at
) values (
  '${tId}', '${regId}', '${tName}', '${uName}', '${lName}', '', '',
  '${inst}', 'Engineering', 'Student', '${ps}', '${pass}',
  'VERIFIED', 100, 'REGISTERED', 'SUBMISSION_OPEN', 'LOCKED',
  'Official verified roster (2026-09-08)', '${now}', '${now}'
);

insert into public.payments (
  team_id, utr_number, payer_name, payer_upi, amount, payment_status,
  notes, submitted_at, verified_at, verified_by
) values (
  '${tId}', 'VERIFIED-${regId}', '${lName}', 'official@upi', 100, 'VERIFIED',
  'Verified from official Secretariat roster', '${now}', '${now}', 'Admin Secretariat'
);
`;

    for (const m of t.members) {
      const mName = escapeSql(m.member_name);
      sql += `insert into public.team_members (
  team_id, member_number, member_name, team_name, member_phone, member_email, department, year, created_at
) values (
  '${tId}', ${m.member_number}, '${mName}', '${tName}', '', '', 'Engineering', 'Student', '${now}'
);
`;
    }
  }

  sql += `
commit;
`;
  return sql;
}

// Execute the generation and file updates
const { processedTeams, processedPayments, duplicateFlags } = buildCleanRecords();

console.log(`\n========================================`);
console.log(`Processing Complete!`);
console.log(`Total squads processed: ${processedTeams.length}`);
console.log(`Total payments created: ${processedPayments.length}`);
console.log(`Duplicate people names detected & removed: ${duplicateFlags.length}`);
console.log(`========================================`);
duplicateFlags.forEach((d, i) => {
  console.log(` [${i + 1}] ${d.team}: Removed "${d.removed}" (${d.reason})`);
});

// Update local json store
const dataDir = path.join(process.cwd(), '.data');
if (!fs.existsSync(dataDir)) fs.mkdirSync(dataDir, { recursive: true });

const storePath = path.join(dataDir, 'orion_store.json');
const storeContent = {
  teams: processedTeams,
  payments: processedPayments,
  submissions: [],
  resubmissionRequests: [],
  suspicionFlags: [],
  auditLogs: processedTeams.flatMap(t => t.audit_logs || []),
  passwordResets: [],
  config: {
    registrationOpen: true,
    round1SubmissionDeadline: '2026-09-11T23:59:59+05:30',
    allowRound1Resubmission: true,
    maxFileSizeMb: 10,
    upiId: '8870227906@upi',
    upiPayeeName: 'MSNIHITHAJULIETA',
    upiQrCodeUrl: '/orion_payment_qr.jpg',
    round1FeeInr: 100,
    finalistFeeInr: 250
  }
};

fs.writeFileSync(storePath, JSON.stringify(storeContent, null, 2), 'utf-8');
console.log(`Saved clean local store to: ${storePath}`);

// Write SQL migration
const sqlContent = generateSqlMigration(processedTeams);
const migrationPath = path.join(process.cwd(), 'src', 'db', 'migrations', '019_import_updated_verified_roster.sql');
fs.writeFileSync(migrationPath, sqlContent, 'utf-8');
console.log(`Generated migration script at: ${migrationPath}`);
