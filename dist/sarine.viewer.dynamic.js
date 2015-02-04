(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Viewer.Dynamic = (function(_super) {
    __extends(Dynamic, _super);

    Dynamic.playing = false;

    Dynamic.prototype.nextImage = Error;

    function Dynamic(options) {
      Dynamic.__super__.constructor.call(this, options);
      this.delay = 50;
      Object.getOwnPropertyNames(Viewer.Dynamic.prototype).forEach(function(k) {
        if (this[k].name === "Error") {
          return console.error(this.id, k, "Must be implement", this);
        }
      }, this);
    }

    Dynamic.prototype.play = function(force, delay) {
      var _t;
      if (force) {
        this.playing = true;
      }
      this.nextImage.apply(this);
      if (this.playing) {
        _t = this;
        return this.setTimeout(this.delay).then(_t.play);
      }
    };

    Dynamic.prototype.stop = function() {
      return this.playing = false;
    };

    return Dynamic;

  })(Viewer);

}).call(this);
