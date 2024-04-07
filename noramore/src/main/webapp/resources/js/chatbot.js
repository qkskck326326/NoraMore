// Get chatbot elements
const chatbot = document.getElementById('chatbot');
const conversation = document.getElementById('conversation');
const inputForm = document.getElementById('input-form');
const inputField = document.getElementById('input-field');
const checkboxes = document.querySelectorAll('input[type="checkbox"]');

// Add event listener to input form
inputForm.addEventListener('submit', function(event) {
  // Prevent form submission
  event.preventDefault();

  // Get user input
  const input = inputField.value;

  // Get checked checkboxes
  const checkedItems = [];
  checkboxes.forEach(function(checkbox) {
    if (checkbox.checked) {
      checkedItems.push(checkbox.value);
    }
  });

  // Clear input field
  inputField.value = '';
  const currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: "2-digit" });

  // Add user input to conversation
  let message = document.createElement('div');
  message.classList.add('chatbot-message', 'user-message');
  message.innerHTML = `<p class="chatbot-text" sentTime="${currentTime}">${input}</p>`;
  conversation.appendChild(message);

  // Generate chatbot response
  const response = generateResponse(input, checkedItems);

  // Add chatbot response to conversation
  message = document.createElement('div');
  message.classList.add('chatbot-message','chatbot');
  message.innerHTML = `<p class="chatbot-text" sentTime="${currentTime}">${response}</p>`;
  conversation.appendChild(message);
  message.scrollIntoView({behavior: "smooth"});
});

// Generate chatbot response function
function generateResponse(input, checkedItems) {
    // Add chatbot logic here
    let response = "";

    // Check for specific conditions
    if (input.includes("안녕")) {
        response = "안녕하세요! 반가워요. 😊";
    } else if (input.includes("오늘 날씨")) {
        response = "오늘의 날씨는 맑습니다. 🌞";
    } else if (input.includes("좋아하는 음식")) {
        response = "저는 피자를 좋아해요! 🍕";
    } else if (input.includes("A")) {
        if (checkedItems.includes("A")) {
            response = "사용자가 A를 선택했습니다.";
        } else if (checkedItems.includes("B")) {
            response = "사용자가 B를 선택했습니다.";
        } else {
            response = "아무것도 선택되지 않았습니다.";
        }
    } else {
        // Default response
        const responses = [
            "정확한 질문을 입력해주세요"
        ];
        response = responses[Math.floor(Math.random() * responses.length)];
    }

    return response;
}
