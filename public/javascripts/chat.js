var id = "294544b96ed4494eb3823b264518ca57";
var dev_key = "44e254b810484d75962ed54755fedee9";
$(document).ready(function() {
    $('#message').bind('keydown', function(event) {
        // Only bind to the return/enter key being pressed.
        if(event.which == 13) {

            // Construct some sort of unique identifier (in this case, we are using the UNIX timestamp).
            var key = new Date().getTime();

            // This is our data model. Basically just store the person's name and their message in a JSON object.
            var data = { 'message': $('#message').val(), 'name': $('#name').val() };

            // Call the CloudMine jQuery plugin to actually push the data to the CM servers.
            $.cm.insertValueForKey(id, dev_key, key, data);

            // Clear the message box.
            $('#message').val('');
        }
    });

    // Setup polling of the CloudMine servers to update the chat box.
    setInterval(function() {
        // Call the CloudMine jQuery plugin to grab all the data from the server. In this case
        // we want to get all the keys since they represent all the messages.
        $.cm.getJSON(id, dev_key, null, function(data) {
            var chat = '';

            $.each(data.success, function(key, value) {
                // Basic string concatination to build the string to display to the user in the chat box.
                chat += value.name + ': ' + value.message + "\n";
            });

            // Show the assembled string in the chat box.
            $('#chat').val(chat);
        });
    }, 500);
});
