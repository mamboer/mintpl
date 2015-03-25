var chai    = require('chai');
var assert  = chai.assert;
var expect  = chai.expect;
var pkg     = require('../package.json');
chai.should();

var tpl = require('../src/mintpl');

console.log(tpl);

describe('mintpl',function(){

    describe('#heredoc',function(){

        it('should provide heredoc feature',function(){

            tpl.should.have.property('heredoc');
            var doc0 = new tpl.heredoc(function(){/*!
                <div class="mintpl"><%=name=%></div>
            */});

            doc0.text.should.be.a('string');
            doc0.val().should.be.a('string');

            console.log(doc0.val());

        });

    });

    describe('#render',function(){

        it('should render template properly',function(){

            var html = tpl.render(function(){/*!
                <div class="mintpl"><%=name%></div>
            */},pkg);

            assert.isTrue(html.indexOf(pkg.name)>0);

            console.log(html);

        });
    });

});
