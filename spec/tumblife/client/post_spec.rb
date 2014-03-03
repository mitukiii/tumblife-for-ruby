require 'spec_helper'

describe Tumblife::Client do
  let(:blog) { 'mmtki.tumblr.com' }
  let(:client) { Tumblife.client }

  describe '.text' do
    before do
      stub_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'text', :title => 'title', :body => 'text'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.text(blog, :title => 'title', :body => 'text')
      expect(a_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'text', :title => 'title', :body => 'text'})).
        to have_been_made
    end
  end

  describe '.photo' do
    before do
      stub_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'photo', :caption => 'caption', :source => 'http://example.com/photo.png'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.photo(blog, :caption => 'caption', :source => 'http://example.com/photo.png')
      expect(a_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'photo', :caption => 'caption', :source => 'http://example.com/photo.png'})).
        to have_been_made
    end
  end

  describe '.quote' do
    before do
      stub_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'quote', :quote => 'quote', :source => 'http://example.com/'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.quote(blog, :quote => 'quote', :source => 'http://example.com/')
      expect(a_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'quote', :quote => 'quote', :source => 'http://example.com/'})).
        to have_been_made
    end
  end

  describe '.link' do
    before do
      stub_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'link', :title => 'title', :link => 'http://example.com/'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.link(blog, :title => 'title', :link => 'http://example.com/')
      expect(a_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'link',  :title => 'title', :link => 'http://example.com/'})).
        to have_been_made
    end
  end

  describe '.chat' do
    before do
      stub_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'chat', :title => 'title', :conversation => 'conversation'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.chat(blog, :title => 'title', :conversation => 'conversation')
      expect(a_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'chat',  :title => 'title', :conversation => 'conversation'})).
        to have_been_made
    end
  end

  describe '.audio' do
    before do
      stub_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'audio', :caption => 'caption', :external_url => 'http://example.com/audio.mp3'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.audio(blog, :caption => 'caption', :external_url => 'http://example.com/audio.mp3')
      expect(a_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'audio',  :caption => 'caption', :external_url => 'http://example.com/audio.mp3'})).
        to have_been_made
    end
  end

  describe '.video' do
    before do
      stub_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'video', :caption => 'caption', :embed => 'http://example.com/video.mp4'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.video(blog, :caption => 'caption', :embed => 'http://example.com/video.mp4')
      expect(a_post("/v2/blog/#{blog}/post").
        with(:body => {:type => 'video',  :caption => 'caption', :embed => 'http://example.com/video.mp4'})).
        to have_been_made
    end
  end

  describe '.edit' do
    before do
      stub_post("/v2/blog/#{blog}/post/edit").
        with(:body => {:id => '123456789', :type => 'text', :title => 'new title', :body => 'new text'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.edit(blog, 123456789, :type => 'text', :title => 'new title', :body => 'new text')
      expect(a_post("/v2/blog/#{blog}/post/edit").
        with(:body => {:id => '123456789', :type => 'text', :title => 'new title', :body => 'new text'})).
        to have_been_made
    end
  end

  describe '.reblog' do
    before do
      stub_post("/v2/blog/#{blog}/post/reblog").
        with(:body => {:id => '123456789', :reblog_key => 'abcdef', :comment => 'comment'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.reblog(blog, 123456789, 'abcdef', 'comment')
      expect(a_post("/v2/blog/#{blog}/post/reblog").
        with(:body => {:id => '123456789', :reblog_key => 'abcdef', :comment => 'comment'})).
        to have_been_made
    end
  end

  describe '.delete' do
    before do
      stub_post("/v2/blog/#{blog}/post/delete").
        with(:body => {:id => '123456789'}).
        to_return(:body => fixture('post.json'))
    end
    it 'should request the correct resource' do
      client.delete(blog, 123456789)
      expect(a_post("/v2/blog/#{blog}/post/delete").
        with(:body => {:id => '123456789'})).
        to have_been_made
    end
  end
end
