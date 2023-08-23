import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 167, 45, 204),
        title: const Text('Privacy and Policies', style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 10),
           
          
        
    
            Text(
              'Anjana built the Fitness everyday app as a Free app. This SERVICE is provided by Anjana at no cost and is intended for use as is.\n\n'
              'This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.\n\n'
              'If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.\n\n'
              'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Fitness everyday unless otherwise defined in this Privacy Policy.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Information Collection and Use',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to username, password ,mobile number, email id , age, height, weight. The information that I request will be retained on your device and is not collected by me in any way.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Log Data',
               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.',
               style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Cookies',
             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.,\nThis Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Service Providers',
               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "I may employ third-party companies and individuals due to the following reasons:\n"
              "To facilitate our Service;"
              "To provide the Service on our behalf;"
              "To perform Service-related services; or"
              "To assist us in analyzing how our Service is used."
              "I want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Links to Other Sites',
             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.',
               style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Children’s Privacy',
               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "I do not knowingly collect personally identifiable information from children. I encourage all children to never submit any personally identifiable information through the Application and/or Services. I encourage parents and legal guardians to monitor their children's Internet usage and to help enforce this Policy by instructing their children never to provide personally identifiable information through the Application and/or Services without their permission. If you have reason to believe that a child has provided personally identifiable information to us through the Application and/or Services, please contact us. You must also be at least 16 years of age to consent to the processing of your personally identifiable information in your country (in some countries we may allow your parent or guardian to do so on your behalf).",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Changes to This Privacy Policy',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.\nThis policy is effective as of 2023-08-22',
             style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Contact Us',
               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at anjanapv321@gmail.com.\nThis privacy policy page was created at [privacypolicytemplate.net](https://privacypolicytemplate.net) and modified/generated by [App Privacy Policy Generator](https://app-privacy-policy-generator.nisrulz.com/)',
                style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
