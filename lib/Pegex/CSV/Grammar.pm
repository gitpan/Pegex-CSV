package Pegex::CSV::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'share/csv.pgx';

sub Xmake_tree {   # Generated/Inlined by Pegex::Grammar (0.57)
  {
    '+toprule' => 'csv',
    'ALL' => {
      '.rgx' => qr/\G[\s\S]/
    },
    'csv' => {
      '+min' => 0,
      '.ref' => 'row'
    },
    'double' => {
      '.rgx' => qr/\G[\ \t]*"((?:""|[^"])*)"/
    },
    'plain' => {
      '.rgx' => qr/\G[\ \t]*((?:[^,"\r\n]*[^\ \t,"\r\n])?)/
    },
    'row' => {
      '.all' => [
        {
          '+asr' => 1,
          '.ref' => 'ALL'
        },
        {
          '+max' => 1,
          '.all' => [
            {
              '.any' => [
                {
                  '.ref' => 'double'
                },
                {
                  '.ref' => 'plain'
                }
              ]
            },
            {
              '+min' => 0,
              '-flat' => 1,
              '.all' => [
                {
                  '.rgx' => qr/\G[\ \t]*,/
                },
                {
                  '.any' => [
                    {
                      '.ref' => 'double'
                    },
                    {
                      '.ref' => 'plain'
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          '.rgx' => qr/\G[\ \t]*(?:\r?\n|\r|\z)/
        }
      ]
    }
  }
}

1;
