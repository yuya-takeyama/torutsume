class GitServiceProvider < Dee::Rails::ServiceProvider
  provide do
    singleton 'git.repository_creator' do
      Torutsume::Git::RepositoryCreator.new(
        repository_class: Rugged::Repository,
        repository_path_finder: self['git.repository_path_finder'],
        commit_writer: self['git.commit_writer'],
      )
    end

    singleton 'git.repository_path_finder' do
      Torutsume::Git::RepositoryPathFinder.new(
        rails_root: Rails.root,
        rails_env: Rails.env,
      )
    end

    singleton 'git.commit_writer' do
      Torutsume::Git::CommitWriter.new(
        index_class: Rugged::Index,
        commit_class: Rugged::Commit,
      )
    end
  end
end
