// Copyright 2005 Google Inc.  All Rights Reserved.

function FriendSelector() {
}

/**
 * initialize the objects and render the display
 */
FriendSelector.prototype.init = function() {
  this.createObjects();
  this.filterFriends();
  //this.refreshButtons();
  this.addFriend.focus();
}

/**
 * initialize the object pointers
 */
FriendSelector.prototype.createObjects = function() {
  this.addFriend = document.getElementById("addFriend");
  this.friendCount = document.getElementById("friendCount");

  this.criteria = document.getElementById("criteria");
  this.queryString = document.getElementById("queryString");

  this.friendListMaster = document.getElementById("friendListMaster");
  this.friendList = document.getElementById("friendList");
  this.inviteList = document.getElementById("inviteList");
/*
  this.addAllButton = document.getElementById("addAllButton");
  this.addButton = document.getElementById("addButton");
  this.removeButton = document.getElementById("removeButton");
  this.removeAllButton = document.getElementById("removeAllButton");
*/
}

/**
 * return the ASCII for the key press
 *
 * This function is capable of handling both IE and Firefox
 */
FriendSelector.prototype.getKeyPressed = function(e) {
  return (window.event ? e.keyCode : e.which);
}

/**
 * remove HTML-style tags from str
 */
FriendSelector.prototype.removeTags = function(str) {
  var idx = str.search(/<.*>/);

  while (idx > -1) {
    str = str.substr(0, idx) + str.substr(str.indexOf(">", idx) + 1);
    idx = str.search(/<.*>/);
  }

  return str.replace("<", "&lt;").replace(">", "&gt;");
}

/**
 * refresh the display to retain the correct list of friends
 */
FriendSelector.prototype.filterFriends = function() {
  var queryStr = this.addFriend.value.toLowerCase();
  var listLen;

  listLen = this.friendList.options.length;
  for (var i = listLen - 1; i > -1; i--) {
    if (this.friendList.options[i].text.toLowerCase().indexOf(queryStr) == -1) {
      this.insertInOrder(this.friendListMaster, this.friendList.options[i]);
    }
  }

  listLen = this.friendListMaster.options.length;
  for (var i = listLen - 1; i > -1; i--) {
    var opt = this.friendListMaster.options[i];
    if (opt.text.toLowerCase().indexOf(queryStr) > -1) {
      this.insertInOrder(this.friendList, opt);
    }
  }

  this.friendCount.innerHTML = this.friendList.options.length;  
  if (queryStr != "") {
    this.queryString.innerHTML = this.removeTags(queryStr);
    this.criteria.style.display = "inline";
  } else {
    this.criteria.style.display = "none";
  }

  //this.refreshButtons();
}

/**
 * refresh the 4 action buttons depending on the number of entries in the lists
 */
FriendSelector.prototype.refreshButtons = function() {
  this.addAllButton.disabled = (this.friendList.options.length < 1);
  this.addButton.disabled = (this.friendList.selectedIndex < 0);
  this.removeAllButton.disabled = (this.inviteList.options.length < 1);
  this.removeButton.disabled = (this.inviteList.selectedIndex < 0);
}

/**
 * select all entries in the inviteList
 */
FriendSelector.prototype.selectAll = function() {
  var listLen = this.inviteList.options.length;
  
  for (var i = 0; i < listLen; i++) {
    this.inviteList.options[i].selected = true;
  }
}

/**
 * unselect all entries in both the friendList and the inviteList
 */
FriendSelector.prototype.selectNone = function() {
  this.friendList.selectedIndex = -1;
  this.inviteList.selectedIndex = -1;
}

/**
 * insert item into list in a sorted fashion
 */
FriendSelector.prototype.insertInOrder = function(list, item) {
  var listLen = list.options.length;
  
  if (listLen > 0) {
    for (var i = 0; i < listLen; i++) {
      if (item.text <= list.options[i].text) {
        list.insertBefore(item, list.options[i]);
        item.selected = false;
        return;
      }
    }
  }

  list.appendChild(item);
  item.selected = false;
}

/**
 * move all items from friendList to inviteList
 */
FriendSelector.prototype.addAllFriends = function() {
  var listLen = this.friendList.options.length;
  
  for (var i = listLen - 1; i > -1; i--) {
    this.insertInOrder(this.inviteList, this.friendList.options[i]);
  }
  
  this.filterFriends();
  //this.refreshButtons();
}

/**
 * move the selected items from friendList to inviteList
 */
FriendSelector.prototype.addFriends = function() {
  var listLen = this.friendList.options.length;
  
  for (var i = listLen - 1; i > -1; i--) {
    if (this.friendList.options[i].selected) {
      this.insertInOrder(this.inviteList, this.friendList.options[i]);
    }
  }
  
  this.filterFriends();
  this.refreshButtons();
}

/**
 * remove the selected items from inviteList to friendList
 */
FriendSelector.prototype.removeInvites = function() {
  var listLen = this.inviteList.options.length;
  
  for (var i = listLen - 1; i > -1; i--) {
    if (this.inviteList.options[i].selected) {
      this.insertInOrder(this.friendList, this.inviteList.options[i]);
    }
  }
  
  this.filterFriends();
  this.refreshButtons();
}

/**
 * remove all items from inviteList to friendList
 */
FriendSelector.prototype.removeAllInvites = function() {
  var listLen = this.inviteList.options.length;
  
  for (var i = listLen - 1; i > -1; i--) {
    this.insertInOrder(this.friendList, this.inviteList.options[i]);
  }
  
  this.filterFriends();
  this.refreshButtons();
}