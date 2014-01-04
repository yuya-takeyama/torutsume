class GitServiceProvider < Dee::Rails::ServiceProvider
  provide do
    singleton 'git.repository_writer' do
      Torutsume::Git::RepositoryWriter.new(
        repository_creator: self['git.repository_creator'],
        repository_loader: self['git.repository_loader'],
        commit_writer: self['git.commit_writer'],
      )
    end

    singleton 'git.repository_creator' do
      Torutsume::Git::RepositoryCreator.new(
        repository_class: Rugged::Repository,
        repository_path_finder: self['git.repository_path_finder'],
      )
    end

    singleton 'git.repository_loader' do
      Torutsume::Git::RepositoryLoader.new(
        repository_class: Rugged::Repository,
        repository_path_finder: self['git.repository_path_finder'],
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

    singleton 'git.blame_loader' do
      Torutsume::Git::BlameLoader.new(
        blame_class: Rugged::Blame,
        commit_class: Rugged::Commit,
        blob_class: Rugged::Blob,
      )
    end
  end
end
