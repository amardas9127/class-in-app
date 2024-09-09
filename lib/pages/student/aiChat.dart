import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AiChat extends StatefulWidget {
  const AiChat({super.key});

  @override
  State<AiChat> createState() => _AiChatState();
}

class _AiChatState extends State<AiChat> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages =
      []; // List to store both user and AI messages
  bool _isLoading = false; // State to show progress indicator
  bool _isButtonDisabled = false; // State to disable/enable send button

  // Function to call the AI API
  Future<String> _getAiResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyDf9MJMB-5I_6O7LCrNunZhUuNDzB1lHSs'), // Replace YOUR_API_KEY with actual API key
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': userMessage}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Extract the AI response text from the response body
        if (data.containsKey('candidates') &&
            data['candidates'] is List &&
            data['candidates'].isNotEmpty &&
            data['candidates'][0].containsKey('content') &&
            data['candidates'][0]['content'].containsKey('parts') &&
            data['candidates'][0]['content']['parts'] is List &&
            data['candidates'][0]['content']['parts'].isNotEmpty) {
          return data['candidates'][0]['content']['parts'][0]['text'] ??
              "No response text found.";
        } else {
          return "Error: Unexpected response structure.";
        }
      } else {
        return "Error: Failed to get response from AI.";
      }
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }

  // Modified sendMessage function to include API call
  void _sendMessage() async {
    String userMessage = _messageController.text.trim();

    if (userMessage.isNotEmpty) {
      setState(() {
        _isButtonDisabled = true; // Disable the send button
        _isLoading = true; // Show progress indicator
        _messages
            .add({'role': 'user', 'message': userMessage}); // Add user message
        _messageController.clear();
      });

      // Get AI response
      String aiResponse = await _getAiResponse(userMessage);

      setState(() {
        _isLoading = false; // Hide progress indicator
        _isButtonDisabled = false; // Re-enable the send button
        _messages.add({'role': 'ai', 'message': aiResponse}); // Add AI response
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgclr,
          appBar: AppBar(
            backgroundColor: bgclr,
            centerTitle: true,
            title: Text(
              "CLASS-IN",
              style: TextStyle(
                color: textclr,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              // Expanded ListView to display messages
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    bool isUserMessage = _messages[index]['role'] == 'user';
                    return Padding(
                      padding: EdgeInsets.only(
                        left: isUserMessage ? 80.r : 10.r,
                        right: isUserMessage ? 10.r : 80.r,
                        top: 10.r,
                        bottom: 5.r,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width:1.0,
                            color: shadowclr,
                            
                             ),
                          boxShadow: [
                            BoxShadow(
                                color: shadowclr,
                                offset: Offset(3.r, 3.r),
                                blurRadius: 6.r,
                                inset: isUserMessage),
                            BoxShadow(
                                color: highlightclr,
                                offset: Offset(-3.r, -3.r),
                                blurRadius: 6.r,
                                inset: isUserMessage),
                          ],
                          color: bgclr, // Grey for AI messages
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          _messages[index][
                              'message']!, // Access the 'message' key in the map
                          style: TextStyle(
                            color: textclr,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Show loading indicator when waiting for response
              if (_isLoading)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: CircularProgressIndicator(color: textclr),
                ),

              // The input field and send button
              Padding(
                padding: EdgeInsets.only(
                    left: 15.r, right: 15.r, bottom: 10.r, top: 10.r),
                child:
                    Stack(alignment: AlignmentDirectional(.95, 0), children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: shadowclr,
                              offset: Offset(3.r, 3.r),
                              blurRadius: 6.r,
                              inset: true),
                          BoxShadow(
                              color: highlightclr,
                              offset: Offset(-3.r, -3.r),
                              blurRadius: 6.r,
                              inset: true),
                        ],
                        borderRadius: BorderRadius.circular(15.0.r),
                        color: bgclr // Match the TextField borderRadius
                        ),
                    child: TextField(
                      controller: _messageController,
                      style: TextStyle(fontSize: 18.sp, height: 3.4.h),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: bgclr,
                              width: 2.0.w), // Border color when enabled
                          borderRadius: BorderRadius.circular(15.0.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: bgclr,
                              width: 2.0.w), // Border color when focused
                          borderRadius: BorderRadius.circular(15.0.r),
                        ),
                        hintText: "Message Class-In",
                        contentPadding: EdgeInsets.all(
                            12.r), // Optional: Adjust padding as needed
                      ),
                    ),
                  ),
                  Container(
                    height: 50.r,
                    width: 50.r,
                    decoration: BoxDecoration(
                      color: bgclr,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: shadowclr,
                          offset: Offset(2.r, 2.r),
                          blurRadius: 4.r,
                        ),
                        BoxShadow(
                          color: highlightclr,
                          offset: Offset(-2.r, -2.r),
                          blurRadius: 4.r,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: _isButtonDisabled
                          ? null
                          : _sendMessage, // Disable button if loading
                      icon: Icon(Icons.send),
                      color: _isButtonDisabled
                          ? Colors.grey
                          : textclr, // Grey color when disabled
                      iconSize: 35.r,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
