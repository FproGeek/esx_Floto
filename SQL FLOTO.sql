CREATE TABLE `user_loterie` (
  `id` int(11) NOT NULL,
  `steamid` varchar(60) NOT NULL,
  `name` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

ALTER TABLE `user_loterie`
  ADD PRIMARY KEY (`id`);