// Copyright 2005 Google Inc.  All Rights Reserved.

function ResizeManager() {
  this.containerWidth = -1;
  this.objList = new Array();
}

ResizeManager.prototype.setContainerWidth = function(width) {
  this.containerWidth = width;
}

/**
 * Adds an object to be managed by RM
 *
 * @param obj     object to be managed
 * @param minSize minimum size for the object
 * @param subAmt  amount subtracted in calculating the width (before divAmt)
 * @param divAmt  amount divided in calculating the width (after subAmt)
 */
ResizeManager.prototype.add = function(obj, minSize, subAmt, divAmt) {
  this.objList.push(new Array(obj, minSize, subAmt, divAmt));
}

/**
 * Resizes an object to the specified width, or the width of the HTML body area
 * if the width is too large
 *
 * @param obj   object to be resized
 * @param width new width for obj
 */
ResizeManager.prototype.resizeObj = function(obj, width) {
  obj.style.width = width;
}

/**
 * Resizes all objects managed by RM according to their parameters
 */
ResizeManager.prototype.resize = function() {
  var bodyWidth = (this.containerWidth == -1) ? this.getBodyWidth() : this.containerWidth;
  var width;

  for (var i = 0; i < this.objList.length; i++) {
    this.resizeObj(this.objList[i][0], this.objList[i][1]);
  }
  
  for (var i = 0; i < this.objList.length; i++) {
    width = Math.max(this.objList[i][1], (bodyWidth - this.objList[i][2]) / this.objList[i][3]);
    this.resizeObj(this.objList[i][0], width);
  }
}

/**
 * @return width of the HTML body area
 */
ResizeManager.prototype.getBodyWidth = function() {
  return document.body.clientWidth - 2;
}
