#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

module GettingStartedHelper
  # @return [Boolean] The user has connected at least one service
  def has_connected_services?
    AppConfig[:configured_services].blank? || current_user.services.size > 0
  end

  # @return [Boolean] The user has at least 3 contacts
  def has_few_contacts?
    current_user.contacts.receiving.size > 2
  end

  # @return [Boolean] The user has followed at least 3 tags
  def has_few_followed_tags?
    current_user.followed_tags.size > 2
  end

  # @return [Boolean] The user has connected to cubbi.es
  def has_connected_cubbies?
    current_user.authorizations.size > 0
  end

  # @return [Boolean] The user has completed all steps in getting started
  def has_completed_getting_started?
    current_user.getting_started == false
  end

  def tag_link(tag_name)
    if tag_followed?(tag_name)
      link_to "##{tag_name}", tag_followings_path(tag_name), :method => :delete, :class => "featured_tag followed"
    else
      link_to "##{tag_name}", tag_tag_followings_path(tag_name), :method => :post, :class => "featured_tag"
    end
  end

  def tag_followed?(tag_name)
    tags.detect{|t| t.name == tag_name}
  end
end
